export class TaskRunner {
  taskLevel = 0;
  constructor(ctx) {
    this.ctx = ctx;
  }

  runOnOS(message, obj) {
    const os = process.env.OS;
    const fn = obj[os];
    if (!fn) {
      this.ctx.log(`OS ${os} not defined for task, skipping`);
    }
    return this.run(message, fn);
  }

  async run(message, fn) {
    const prefix = "=".repeat(this.taskLevel * 2 + 1);
    this.ctx.log(`${prefix} ${message}`);
    this.taskLevel++;
    try {
      await fn();
    } catch (e) {
      this.ctx.log(`TASK FAILED: ${e}`);
      this.ctx.log(e);
    }
    this.taskLevel--;
  }
}
