export async function install(ctx) {
  await ctx.linking.symlink(
    ctx.files.path('.gitconfig'),
    '~/.gitconfig'
  )
}
