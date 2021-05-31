import path from "path";

export class ComponentFiles {
  constructor(ctx, component) {
    this.ctx = ctx;
    this.component = component;
  }

  dir() {
    return this.ctx.fs.useDir(path.resolve(path.dirname(this.component.path), "files"))
  }

  path(...relativePath) {
    return this.dir().path(...relativePath)
  }
}
