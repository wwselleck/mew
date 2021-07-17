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

## Component Context
When invoked, each exposed "action" function gets passed a Context parameter, which contains utilities for the functions to use.

### ctx.log
Just proxies to console.log for now

### ctx.brew
#### ctx.brew.install
Installs a package via brew

### ctx.shell
#### ctx.shell.execute
Executes a terminal command 
```js
ctx.shell.execute('ls -ah')
```

### ctx.files
This context module gives you access to the files that are contained within your components `files` folder. 
```
| zsh
  | files <--- this directory
    | .zshrc
    | .zshenv
  | zsh.mjs
```

#### ctx.files.dir
Returns the files folder as a `Directory` object

#### ctx.files.path(...relativePath)
Returns the path of a file in the files folder given the relative path

#### ctx.files.useDir(dirPath)
Returns a new `Directory` object for a directory within the files directory
