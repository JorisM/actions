#!/bin/bash
set -e
set -o pipefail

if [[ -z "$PRIVATE_KEY" ]]; then
	echo "Set the PRIVATE_KEY secret."
	exit 1
fi

if [[ -z "$PUBLIC_KEY" ]]; then
	echo "Set the PUBLIC_KEY secret."
	exit 1
fi

if [[ -z "$HOST" ]]; then
	echo "Set the HOST env variable."
	exit 1
fi

if [[ -z "$PORT" ]]; then
	echo "Set the PORT env variable."
	exit 1
fi

if [[ -z "$USER" ]]; then
	echo "Set the USER env variable."
	exit 1
fi

if [[ "$GITHUB_REF" != "refs/heads/$BRANCH" ]]; then
	echo "$GITHUB_REF is not refs/head/$BRANCH. Exiting."
	exit 0
fi

SSH_PATH="$HOME/.ssh"

mkdir "$SSH_PATH"
touch "$SSH_PATH/known_hosts"

echo "$PRIVATE_KEY" > "$SSH_PATH/deploy_key"
echo "$PUBLIC_KEY" > "$SSH_PATH/deploy_key.pub"

chmod 700 "$SSH_PATH"
chmod 600 "$SSH_PATH/known_hosts"
chmod 600 "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key.pub"

eval "$(ssh-agent)"
ssh-add "$SSH_PATH/deploy_key"

ssh-keyscan -t rsa,ed25519 "$HOST" >> "$SSH_PATH/known_hosts"

ssh -A -tt -o 'StrictHostKeyChecking=no' -p "$PORT" "$USER"@"$HOST" "$*"
