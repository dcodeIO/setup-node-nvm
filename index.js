const child_process = require("child_process");
const fs = require("fs");
const path = require("path");
const core = require("@actions/core");
const version = core.getInput("node-version");
const mirror = core.getInput("node-mirror");
const cwd = fs.existsSync(path.join(process.cwd(), `.nvmrc`)) ? process.cwd() : __dirname;
const child = child_process.spawn("bash", [ path.join(__dirname, "install.sh"), version, mirror ], { cwd: cwd });
const stdout = [];
child.stdout.on("data", out => {
  stdout.push(out);
  process.stdout.write(out);
});
child.stderr.on("data", out => {
  process.stderr.write(out);
});
child.on("close", code => {
  if (code !== 0) throw Error("installation failed with " + code);
  const out = Buffer.concat(stdout).toString("utf8");
  var nodePath;
  var npmPath;
  try {
    nodePath = /SETUP_NODE_NVM_NODE: ([^\n]+)/.exec(out)[1];
    npmPath = /SETUP_NODE_NVM_NPM: ([^\n]+)/.exec(out)[1];
  } catch (e) {
    throw Error("missing node/npm path in output");
  }
  console.log("Using node: " + nodePath);
  core.addPath(path.dirname(nodePath));
  console.log("Using npm: " + npmPath);
  core.addPath(path.dirname(npmPath));
});
