import path from "path";
import fs from "fs";

export class XDG {
  constructor(ctx) {
    this.ctx = ctx;
  }

  _ensureDir(dirPath) {
    if (!fs.existsSync(dirPath)) {
      fs.mkdirSync(dirPath, {
        recursive: true,
      });
    }
  }

  resolveConfigPath(...filePath) {
    const configPath = path.resolve(process.env.XDG_CONFIG_HOME, ...filePath);
    return configPath;
  }

  resolveDataPath(...filePath) {
    return path.resolve(process.env.XDG_DATA_HOME, ...filePath);
  }
}
