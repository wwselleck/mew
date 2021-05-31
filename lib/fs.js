import path from 'path';
import fs from 'fs'
import readline from 'readline';

  function ensureDir(dirPath) {
    if (!fs.existsSync(dirPath)) {
      fs.mkdirSync(dirPath, {
        recursive: true,
      });
    }
  }

export class FS {
  constructor(ctx)  {
    this.ctx = ctx;
  }


  useDir(dirPath) {
    ensureDir(dirPath)
    return new Directory(this.ctx, dirPath)
  }

  useXDGConfigDir(configDirName) {
    const dirPath = path.resolve(
      process.env.XDG_CONFIG_HOME,
      configDirName
    )
    return this.useDir(dirPath);
  }

  useXDGDataDir(dataDirName) {
    const dirPath = path.resolve(
      process.env.XDG_DATA_HOME,
      dataDirName
    )
    return this.useDir(dirPath);
  }
}

export class Directory {
  constructor(ctx, dirPath) {
    this.ctx = ctx;
    this.dirPath = dirPath;
  }

  path(...relativeFilePath) {
    return path.resolve(this.dirPath, ...relativeFilePath)
  }

  useDir(...dirPath){
    const resolvedDirPath = path.resolve(this.dirPath, ...dirPath);
    ensureDir(resolvedDirPath)
    return new Directory(this.ctx, resolvedDirPath)
  }

  remove() {
    const rl = readline.createInterface({
              input: process.stdin,
        output: process.stdout,
    })
    rl.question(`Do you really want to remove directory ${this.dirPath}?`, async (answer) => {
      rl.close();
      if(answer.toLowerCase() === 'y') {
        await fs.promises.rm(`${this.dirPath}`, {
          force: true,
          recursive: true
        });
      }
    })
  }
}
