import fs from 'fs';
import { Directory } from './fs.js';

export class MewConfig {
  constructor(ctx)   {
    this.ctx = ctx;
  }

  async readConfigFile() {
    const configFilePath = this.ctx.fs.useMewConfigDir().path('mew.json');

    try {
      await fs.promises.access(configFilePath);
    } catch (e) {
      return {}
    }

    return JSON.parse(await fs.promises.readFile(configFilePath, 'utf-8'));
  }

  async additionalComponentsDirs() {
    const config = await this.readConfigFile();

    return config?.additionalComponentsDirs?.map(path => new Directory(this.ctx, path)) ?? [];
  }
}
