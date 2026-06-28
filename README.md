# Creative OS Homebrew Tap

Install the Creative OS Connector with Homebrew.

```sh
brew tap mikefutia/creativeos
brew trust mikefutia/creativeos
brew install creativeos-connector
creativeos-connector pair
claude setup-token
creativeos-connector auth
brew services restart creativeos-connector
```

`claude setup-token` creates the local Claude Code token used by background
Creative OS runs. `creativeos-connector auth` saves it only on this computer.

If `claude` is not on PATH, Mac users with Claude Code's local install can run
`~/.claude/local/claude setup-token` instead.

For Meta Ads, Higgsfield, and HeyGen in Creative OS, open Settings >
Connections, expand the provider, then click Add. Creative OS asks the local
connector to open the provider sign-in through Claude Code.

Gemini, Firecrawl, and Apify stay as API-key connections inside Creative OS.

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
