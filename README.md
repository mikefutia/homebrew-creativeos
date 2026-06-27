# Creative OS Homebrew Tap

Install the Creative OS Connector with Homebrew.

```sh
brew tap mikefutia/creativeos
brew trust mikefutia/creativeos
brew install creativeos-connector
creativeos-connector pair
brew services start creativeos-connector
```

## Before You Start

- Claude Code must already be installed and signed in on this computer.
- Homebrew must already be installed.
- On Mac, Apple Command Line Tools must be current enough for Homebrew. If Terminal says "Command Line Tools are too outdated," open System Settings > General > Software Update first.
- If Software Update does not show the update, use Apple Developer Downloads for the exact Command Line Tools version named in Terminal.

## What The Connector Does

The connector lets Creative OS send strategist runs to Claude Code on the user's own computer. Creative OS keeps the workspace, team access, files, and saved results in the hosted app. Claude Code does the AI work locally through the user's existing Claude Code login.

## Updating

```sh
brew update
brew upgrade creativeos-connector
```
