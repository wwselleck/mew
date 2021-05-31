export class ComponentData {
  constructor(ctx, component) {
    this.ctx = ctx;
    this.component = component;
  }

  dir() {
    return this.ctx.fs.useXDGDataDir('mew').useDir(this.component.name);
  }

  path(...restOfPath) {
    return this.dir().path(...restOfPath);
  }

  useDir(dirPath) {
    return this.dir().useDir(dirPath);
  }
}
