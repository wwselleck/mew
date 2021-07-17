<div align="center"><img align="center" src="https://assets.pokemon.com/assets/cms2/img/pokedex/full/151.png" width="150px" /></div>
<h1 align="center">mew</h1>
My personal tool for managing and automating many different parts of my existence.

# Install
```
git clone --recurse-submodules git@github.com:wwselleck/mew.git
cd mew
npm install -g .
```

# Usage

## Components
mew itself doesn't provide any practical functionality, it's more of a framework allowing plugins, called "components", to expose functionality via the mew CLI interface. 

A component is defined in a directory containing an `.mjs` file with the same name as the directory itself. That `.mjs` file can export functions, whose names are then exposed via `mew` as actions you can perform on that component. For example, a zsh component might look like

```
# File System
| zsh
  | zsh.mjs
```

```javascript
export function install(ctx) {
  await ctx.brew.install('zsh')
}
```

```bash
> mew zsh install
...
```
