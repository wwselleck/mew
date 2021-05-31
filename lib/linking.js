import fs from "fs";
import path from "path";
import expandTilde from "expand-tilde";

export class Linking {
  constructor(ctx) {
    this.ctx = ctx;
  }

  async symlink(sourcePath, linkPath) {
    return new Promise((resolve, reject) => {
      const absSourcePath = path.resolve(expandTilde(sourcePath));
      const absLinkPath = path.resolve(expandTilde(linkPath));
      this.ctx.log(`Linking ${absSourcePath} to ${absLinkPath}`);
      fs.unlink(absLinkPath, (err) => {
        if (err) {
          //this.ctx.log(`${err}, continuing`);
        }

        fs.symlink(absSourcePath, absLinkPath, (err) => {
          if (err) {
            this.ctx.log(err);
            resolve();
            return;
          }
          this.ctx.log(`Linked ${absSourcePath} to ${absLinkPath}}`);
          resolve();
        });
      });
    });
  }

  async symlinkAll(paths) {
    return Promise.all(Array.from(paths).map((p) => this.symlink(...p)));
  }
}
