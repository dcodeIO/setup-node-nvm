# Set up node using nvm

This action sets up a specific node.js version on GitHub Actions using nvm, very similar to the original [@actions/setup-node](https://github.com/actions/setup-node). Unlike setup-node (at the time of this writing) it does support `lts/*` (latest LTS), `node` (latest stable) and custom mirrors like the one for v8-canary, but does not work on Windows.

## Inputs

### node-version

The node.js version to install and use, according to nvm. Uses the version specified in `.nvmrc` if omitted.

### node-mirror

The node.js mirror to use, e.g. `https://nodejs.org/download/v8-canary/` for node on V8 lkgr.

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
