import path from 'path';
import fs from 'fs'

export async function link(ctx) {
  await ctx.taskRunner.run("Linking ZSH config", async () => {
    const zshConfigDir = ctx.fs.useXDGConfigDir('zsh');

    await ctx.linking.symlinkAll([
      [ctx.files.path(".zshrc"), zshConfigDir.path(".zshrc")],
      [ctx.files.path(".zshenv"), zshConfigDir.path(".zshenv")],
      [ctx.files.path(".zshenv"), "~/.zshenv"],
    ]);
  });
}

export async function install(ctx) {
  await ctx.taskRunner.runOnOS("Installing ZSH", {
    mac: async () => {
      await ctx.brew.install("zsh");
      await ctx.shell.execute("command -v zsh | sudo tee -a /etc/shells");
      await ctx.shell.execute('sudo chsh -s "$(command -v zsh)" "${USER}"');
    },
  });

  await ctx.taskRunner.run("Installing ZPlug", async () => {
    const ZPLUG_EXE_NAME = "zplug";
    if (await ctx.utils.doesProgramExist(ZPLUG_EXE_NAME)) {
      ctx.log(`Zplug already installed, skipping installation`);
      return;
    }
    return ctx.shell.execute(
      "curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh"
    );
  });

  await link(ctx);
}

export async function installPlugin(ctx, gitUrl) {
  await ctx.shell.execute(
    `git -C ${ctx.files.path("plugins")} submodule add ${gitUrl}`
  );
}


export async function registerLocalZshrc(ctx, filePath) {
  const localZshrcDir = ctx.fs.useXDGDataDir('mew').useDir('zsh', 'localZshrcs');

  const fileName = path.basename(filePath);
  await ctx.linking.symlink(filePath, localZshrcDir.path(fileName))
}

export async function unregisterLocalZshrc(ctx, filePath) {
  const localZshrcDir = ctx.fs.useXDGDataDir('mew').useDir('zsh', 'localZshrcs');
  const fileName = path.basename(filePath);
  const pathToDelete = localZshrcDir.path(fileName);
  await fs.promises.unlink(pathToDelete)

}
