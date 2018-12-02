# SSH for GitHub Actions

Run a thing on your server.

This action will run the provided argument as a command on your $HOST via SSH.

## Usage

To use the action simply add the following lines to your `.github/main.workflow`

```
action "Run deploy script" {
  uses = "pixel-plus-lab/actions/ssh@master"
  args = "/opt/deploy/run"
  secrets = [
    "PRIVATE_KEY",
    "PUBLIC_KEY",
    "HOST",
    "USER"
  ]
}
```

### Required Arguments

The argument you will use is the command that will be ran on your sever via SSH.

#### Examples

* ```args = "/opt/deploy/run"```
* ```args = "touch ~/.reload"```

### Required Secrets

You'll need to provide some secrets to use the action.

* **PRIVATE_KEY**: Your SSH private key.
* **PUBLIC_KEY**: Your SSH public key.
* **HOST**: The host the action will SSH to to run the command. ie, `your.site.com`.
* **USER**: The user the SSH command will auth as with the public key.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
