export class Brew {
  constructor(ctx) {
    this.ctx = ctx;
  }

  async install(name) {
    await this.ctx.shell.execute(`brew install ${name}`);
  }

  async upgrade(name) {
    await this.ctx.shell.execute(`brew upgrade ${name}`);
  }

  async installCask(name) {
    await this.ctx.shell.execute(`brew cask install ${name}`);
  }

  async tap(name) {
    await this.ctx.shell.execute(`brew tap ${name}`);
  }
}
