import { spawn } from "child_process";

export class Shell {
  constructor(ctx) {
    this.ctx = ctx;
  }

  execute(command, options = {}) {
    return new Promise((resolve, reject) => {
      const _options = {
        shell: true,
        stdio: options.captureOutput ? "pipe" : "inherit",
        ...options,
      };
      console.log(_options);

      this.ctx.taskRunner.run(`Executing [${command}]`, () => {
        const cmd = spawn(command, _options);

        const result = {
          code: -1,
          stdout: "",
          stderr: "",
        };

        if (options.captureOutput) {
          cmd.stdout.on("data", (data) => {
            result.stdout = result.stdout + data;
          });
          cmd.stderr.on("data", (data) => {
            result.stderr = result.stderr + data;
          });
        }
        if (_options.detached) {
          cmd.unref();
          resolve();
        } else {
          cmd.on("close", (code) => {
            result.code = code;
            console.log(result);
            resolve(result);
          });
        }
      });
    });
  }
}
