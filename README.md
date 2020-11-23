# Set up node using nvm

This action sets up a specific node.js version on GitHub Actions using [nvm](https://github.com/nvm-sh/nvm), very similar to [@actions/setup-node](https://github.com/actions/setup-node). Unlike setup-node (at the time of this writing) it does support several aliases and custom mirrors like the one for [node-v8](https://github.com/nodejs/node-v8). Note that this is merely intended as a placeholder until setup-node supports [aliases](https://github.com/actions/setup-node/issues/26), which is crucial for rolling testing, and [mirrors](https://github.com/actions/setup-node/issues/65), which is useful for WebAssembly testing. Has some Windows support via [nvm-windows](https://github.com/coreybutler/nvm-windows), but there are issues with versions newer than current and `.nvmrc`.

## Inputs

### node-version

The node.js version to install and use, according to nvm. Uses the version specified in `.nvmrc` if omitted.

### node-mirror

The node.js mirror to use, e.g. `https://nodejs.org/download/v8-canary/` for node on V8 lkgr.

### node-arch (Windows only)

The architecture of node.js to use. Defaults to system arch if omitted. More info about nvm-windows arch modifier [here](https://github.com/coreybutler/nvm-windows#usage).
Note that the action will reject to run on both GNU/Linux and macOS if node-arch is provided.

## Example usage:

```yaml
uses: dcodeIO/setup-node-nvm@master
with:
  node-version: lts/*
```

```yaml
uses: dcodeIO/setup-node-nvm@master
with:
  node-version: node
  node-mirror: https://nodejs.org/download/v8-canary/
```
