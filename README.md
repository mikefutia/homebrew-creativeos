# Creative OS Homebrew Tap

Install the Creative OS Connector with Homebrew.

```sh
brew tap mikefutia/creativeos
brew install creativeos-connector
creativeos-connector pair
brew services start creativeos-connector
```

Claude Code must already be installed and signed in on this computer.

## What The Connector Does

The connector lets Creative OS send strategist runs to Claude Code on the user's own computer. Creative OS keeps the workspace, team access, files, and saved results in the hosted app. Claude Code does the AI work locally through the user's existing Claude Code login.

## Updating

```sh
brew update
brew upgrade creativeos-connector
```
