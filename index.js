#!/usr/bin/env node

import url from "url";
import path from "path";
import { TaskRunner } from "./lib/task-runner.js";
import { Brew } from "./lib/brew.js";
import { Shell } from "./lib/shell.js";
import { Linking } from "./lib/linking.js";
import { ComponentData } from "./lib/data.js";
import { ComponentFiles } from "./lib/files.js";
import { FS } from './lib/fs.js'

const loadComponent = async (componentName) => {
  const componentPath = path.resolve(
    path.dirname(url.fileURLToPath(import.meta.url)),
    "components",
    componentName,
    `${componentName}.js`
  );
  const componentModule = await import(componentPath);
  if (!componentModule) {
    return null;
  }
  const component = {
    name: componentName,
    path: componentPath,
    componentModule,
  };
  return component;
};

const buildContextForComponent = (component) => {
  const ctx = {};
  ctx.log = console.log;
  ctx.taskRunner = new TaskRunner(ctx);
  ctx.brew = new Brew(ctx);
  ctx.shell = new Shell(ctx);
  ctx.linking = new Linking(ctx);
  ctx.data = new ComponentData(ctx, component);
  ctx.files = new ComponentFiles(ctx, component);
  ctx.fs = new FS(ctx);
  ctx.utils = {
    doesProgramExist: async (name) => {
      const result = await ctx.shell.execute(`command -v ${name}`);
      return result.code === 0;
    },
  };
  return ctx;
};

async function main() {
  const componentName = process.argv[2];
  const task = process.argv[3];
  const taskArgs = process.argv.slice(4);

  if (task === "edit") {
    executeCommand(`$VISUAL ${__dirname}/components/${mod}`);
    return;
  }
  const component = await loadComponent(componentName);
  if (!component) {
    console.log(`Could not find component: ${componentName}`);
    process.exit(1);
  }
  const taskFn = component.componentModule[task];
  if (!taskFn) {
    console.log(`Component ${component.name} does not have task ${task}`);
    process.exit(1);
  }

  const ctx = buildContextForComponent(component);
  await ctx.taskRunner.run(
    `Running ${componentName} ${task} (${taskArgs})`,
    async () => {
      await taskFn(ctx, ...taskArgs);
    }
  );
}

main();
