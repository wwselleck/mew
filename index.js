#!/usr/bin/env node

import url from "url";
import path from "path";

import { Context } from './lib/context.js'
import { Directory } from './lib/fs.js';

const loadComponent = async (ctx, componentName) => {
  const componentsDirs = [
    new Directory(
      ctx,
      path.resolve(
        path.dirname(url.fileURLToPath(import.meta.url)),
        "components",
      )
    ),
    ...(await ctx.mewConfig.additionalComponentsDirs())
  ];

  for(const componentsDir of componentsDirs) {
    if(await componentsDir.hasDir(componentName)) {
      const componentDir = componentsDir.useDir(componentName);
      const componentFileName = `${componentName}.mjs`;
      if(componentDir.hasFile(componentFileName)) {
        const componentFilePath = componentDir.path(componentFileName);
        const componentModule = await import(componentFilePath)
        return {
          name: componentName,
          path: componentFilePath,
          componentModule
        }
      }
    }
  }
};


async function main() {
  const componentName = process.argv[2];
  const task = process.argv[3];
  const taskArgs = process.argv.slice(4);

  const ctx = new Context();

  const component = await loadComponent(ctx, componentName);

  if (!component) {
    console.log(`Could not find component: ${componentName}`);
    process.exit(1);
  }
  const taskFn = component.componentModule[task];
  if (!taskFn) {
    console.log(`Component ${component.name} does not have task ${task}`);
    process.exit(1);
  }

  await ctx.taskRunner.run(
    `Running ${componentName} ${task} (${taskArgs})`,
    async () => {
      await taskFn(ctx, ...taskArgs);
    }
  );
}

main();
