# Creative OS Homebrew Tap

Install the Creative OS Connector with Homebrew.

```sh
curl -fsSL https://claude.ai/install.sh | bash
brew tap mikefutia/creativeos
brew trust mikefutia/creativeos
brew install creativeos-connector
# Paste the full pairing command from Creative OS Settings > Claude Code.
creativeos-connector auth
brew services restart creativeos-connector
```

The Claude Code CLI install creates the local `claude` terminal command.
The pairing command registers this computer with Creative OS.
`creativeos-connector auth` asks the local Claude Code terminal tool for
background authorization and saves it only on this computer.

For Meta Ads, Higgsfield, and HeyGen in Creative OS, open Settings >
Connections, expand the provider, then click Add. Creative OS asks the local
connector to open the provider sign-in through Claude Code and complete the
local callback after you approve access in Chrome or Safari.

Gemini, Firecrawl, and Apify stay as API-key connections inside Creative OS.

## Before You Start

- Claude Code CLI must be installed on this computer. The Claude web app or desktop app alone is not enough.
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
