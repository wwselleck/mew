async function installNeovim(ctx) {
  return ctx.taskRunner.runOnOS("Installing Neovim", {
    ubuntu: async () => {
      await ctx.apt.addRepository("ppa:neovim-ppa/unstable");
      await ctx.apt.update();
      await ctx.apt.install("python-dev python-pip python3-dev python3-pip");
      await ctx.apt.install("neovim");
    },
    mac: async () => {
      await ctx.brew.install("neovim");
    },
  });
}

export async function link(ctx) {
  await ctx.taskRunner.run("Linking Neovim config", async () => {
    const nvimConfigDir = ctx.fs.useXDGConfigDir('nvim');
    const filesDir = ctx.files.dir();

    await ctx.linking.symlinkAll([
      [filesDir.path(".vimrc"), nvimConfigDir.path("init.vim")],
      [filesDir.path("third_party_plugins.vim"), nvimConfigDir.path("third_party_plugins.vim")],
      [filesDir.path("plugin"), nvimConfigDir.path("plugin")],
    ]);
  });
}

async function installNeovimPythonPackage(ctx) {
  return ctx.taskRunner.run(`Installing Neovim Python package`, () => {
    return ctx.shell.execute("pip install pynvim");
  });
}

async function installNeovimRemote(ctx) {
  return ctx.taskRunner.run("Installing nvr", () => {
    return ctx.shell.execute("pip install neovim-remote");
  });
}

async function installVimPlug(ctx) {
  return ctx.taskRunner.run("Installing VimPlug", async () => {
    await ctx.shell.execute(
      'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    );
  });
}

async function installJSTSLangServer(ctx) {
  return ctx.taskRunner.run("Installing JSTS Language server", () => {
    return ctx.shell.execute("npm install -g javascript-typescript-langserver");
  });
}

async function installPlugins(ctx) {
  return ctx.taskRunner.run("Installing nvim plugins", () => {
    return ctx.shell.execute("nvim +PlugInstall +qall");
  });
}

export async function install(ctx) {
  await installNeovim(ctx);
  await link(ctx);
  await installNeovimPythonPackage(ctx);
  await installNeovimRemote(ctx);
  await installVimPlug(ctx);
  await installJSTSLangServer(ctx);
  await installPlugins(ctx);
}
