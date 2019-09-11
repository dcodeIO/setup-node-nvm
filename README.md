# Set up node using nvm

This action sets up a specific node.js version on GitHub Actions using nvm.

## Inputs

### node-version

The node.js version to install and use, according to nvm.

### node-mirror

The node.js mirror to use, e.g. `https://nodejs.org/download/v8-canary/` for canary.

## Example usage:

```yaml
uses: dcodeIO/setup-node-nvm
with:
  node-version: lts/*
```

```yaml
uses: dcodeIO/setup-node-nvm
with:
  node-version: node
  node-mirror: https://nodejs.org/download/v8-canary/
```
