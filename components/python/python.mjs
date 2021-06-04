export async function install(ctx) {
  await ctx.taskRunner.runOnOS("Installing pyenv", {
    ubuntu: async () => {
      /*
       * Copied from old dotfiles, needs translation to mew
      await executeCommand("curl https://pyenv.run | bash");
      await executeCommand(
        "sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
      libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
      xz-utils tk-dev libffi-dev liblzma-dev python-openssl git"
      );
      */
    },
    mac: async () => {
      await ctx.shell.execute('git clone https://github.com/pyenv/pyenv.git ~/.pyenv')
    },
  })
}
