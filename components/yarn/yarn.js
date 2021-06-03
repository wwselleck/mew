export async function install(ctx) {
  return ctx.taskRunner.runOnOS('Installing yvm', {
    mac: async() => {
      await ctx.brew.install('tophat/bar/yvm --without-node')
    }
  })
}
