const child_process = require("child_process");
const core = require("@actions/core");
const version = core.getInput("node-version");
const mirror = core.getInput("node-mirror");
var child = child_process.spawnSync("bash", [ "install.sh", version, mirror ], { stdio: "inherit", encoding: "utf8" });
if (child.status != 0) throw Error("installation failed with " + child.status);
var nodePath;
var npmPath;
try {
  nodePath = /SETUP_NODE_NVM_NODE: ([^\n]+)/.exec(child.stdout)[1];
  npmPath = /SETUP_NODE_NVM_NPM: ([^\n]+)/.exec(child.stdout)[1];
} catch (e) {
  throw Error("missing node/npm path in output");
}
console.log("Using node: " + nodePath);
core.setPath(nodePath);
console.log("Using npm: " + npmPath);
core.setPath(npmPath);
