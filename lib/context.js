import { TaskRunner } from "./task-runner.js";
import { Brew } from "./brew.js";
import { Shell } from "./shell.js";
import { Linking } from "./linking.js";
import { ComponentData } from "./data.js";
import { ComponentFiles } from "./files.js";
import { FS } from './fs.js'
import { MewConfig } from './mew-config.js'

export class Context {
  constructor(component) {
    if(component) {
      this.component = component;
    }
  }

  setComponent(component) {
    this.component = component;
  }

  get log() {
    return console.log;
  }

  get taskRunner() {
    return new TaskRunner(this);
  }

  get brew() {
    return new Brew(this);
  }

  get shell() {
    return new Shell(this);
  }

  get linking() {
    return new Linking(this)
  }

  get mewConfig() {
    return new MewConfig(this);
  }

  get data() {
    if(!this.component) {
      throw new Error('Cannot access data: Context has no component set')
    }
    return new ComponentData(this, this.component);
  }

  get utils() {
    return {

    doesProgramExist: async (name) => {
      const result = await ctx.shell.execute(`command -v ${name}`);
      return result.code === 0;
    },
    }

  }

  get files() {
    if(!this.component) {
      throw new Error('Cannot access files: Context has no component set')
    }
    return new ComponentFiles(this, this.component);

  }

  get fs() {
    return new FS(this);
  }
}
