import { promises as fs } from "fs";

export async function install(ctx) {
  await ctx.taskRunner.runOnOS({
    mac: async () => {
      await ctx.brew.installCask("google-chrome");
    },
  });
}

export async function openProfile(ctx, profile) {
  const profileDataPath = ctx.data.useDir("profiles").path(profile);

  ctx.shell.execute(
    `/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome --remote-debugging-port=9222 --user-data-dir=${profileDataPath}`,
    {
      detached: true,
      stdio: "ignore",
    }
  );
}

export async function clearProfiles(ctx) {
  const profileDataDir = ctx.data.useDir("profiles");
  await profileDataDir.remove();
}
