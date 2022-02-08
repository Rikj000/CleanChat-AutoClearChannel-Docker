# CleanChat-AutoClearChannel-Docker
***A self-hosted Discord bot, made compatible with [`dokku`](https://dokku.com/) & [`docker`](https://www.docker.com/) for easy deployment!***

<p align="left">
    <a href="https://github.com/Rikj000/CleanChat-AutoClearChannel-Docker#readme">
        <img src="https://img.shields.io/badge/Docs-CleanChat_AutoClearChannel_Docker-blue?logo=libreoffice&logoColor=white" alt="The current place where you can find all CleanChat AutoClearChannel Docker Documentation!">
    </a> <a href="https://www.alexandernorup.com/CleanChatAutoClearChannel">
        <img src="https://img.shields.io/badge/Docs-Official_CleanChat_AutoClearChannel-blue?logo=libreoffice&logoColor=white" alt="The current place where you can find all Official CleanChat AutoClearChannel Documentation!">
    </a> <a href="https://www.iconomi.com/register?ref=JdFzz">
        <img src="https://img.shields.io/badge/Join-ICONOMI-blue?logo=bitcoin&logoColor=white" alt="ICONOMI - The world’s largest crypto strategy provider">
    </a> <a href="https://www.buymeacoffee.com/Rikj000">
        <img src="https://img.shields.io/badge/-Buy%20me%20a%20Coffee!-FFDD00?logo=buy-me-a-coffee&logoColor=black" alt="Buy me a Coffee as a way to sponsor this project!">
    </a> <a href="https://github.com/Rikj000/CleanChat-AutoClearChannel-Docker/blob/development/LICENSE">
        <img src="https://img.shields.io/github/license/Rikj000/CleanChat-AutoClearChannel-Docker?label=License&logo=gnu" alt="GNU General Public License">
    </a>
</p>

**CleanChat ACC** (AutoClearChannel),   
is a simple self-hosted Discord bot which can automatically delete messages after a certain delay in a channel.   
It also includes a [`purge`](#purge) command for easily purging loads of messages really quickly.   
The bot itself is a replacement for the AutoClearChannel in CleanChat.

Here is a [small tutorial video](https://yewtu.be/watch?v=hTeU351TFck) showing what AutoClearChannel can do,   
and how to make a server via the hosting service with no prior knowlegde of the bot.

**Authors**
- CleanChat ACC: [@AlexanderNorup](https://github.com/AlexanderNorup)
- [`dokku`](https://dokku.com/) & [`docker`](https://www.docker.com/) support: [@Rikj000](https://github.com/Rikj000)


## Table of Contents
- [CleanChat-AutoClearChannel-Docker](#cleanchat-autoclearchannel-docker)
  - [Table of Contents](#table-of-contents)
  - [Hosting](#hosting)
    - [Prerequisites](#prerequisites)
    - [Docker Installation](#docker-installation)
    - [Dokku Installation](#dokku-installation)
    - [Native Installation](#native-installation)
    - [Downloads](#downloads)
  - [Configuration](#configuration)
  - [Usage](#usage)
    - [Commands](#commands)
    - [`help`](#help)
    - [`autoclearchannel`](#autoclearchannel)
    - [`status`](#status)
    - [`reset`](#reset)
    - [`forcepublicreply`](#forcepublicreply)
    - [`purge`](#purge)
  - [Internet Archive - Clean Chat Backups](#internet-archive---clean-chat-backups)


## Hosting
**WARNING:** The bot is **self-hosted** meaning that you will have to host it yourself!

There are multiple options for self-hosting:
- [`docker` installation](#docker-installatio)
- [`dokku` installation](#dokku-installation)
- [native installation](#native-installation)


### Prerequisites
1. Create a new application on the [Discord Developer Portal](https://discordapp.com/developers/applications)
2. Configure your new application as following:
    - Go to **Bot**
        - Click `add bot`
        - Disable `public bot`
        - Enable all `Privileged Gateway Intents`
    - Go to **OAuth => URL Generator**
        - Select **Scopes**: `bot`
        - Select **Bot Permissions**: 
            - `Manage Webhooks`
            - `Read Messages/View Channels`
            - `Send Messages`
            - `Send Messages in Threads`
            - `Manage Messages`
            - `Manage Threads`
            - `Read Message History`
        - Copy the **Generated URL** & use it to add your Bot to your server


### Docker Installation
1. Make sure you have [`docker`](https://www.docker.com/) installed on your server.
2. [Download](#downloads) the latest **CleanChat AutoClearChannel Docker**
3. Unzip the `.zip` package on your computer.
4. Copy & rename the `config.json.sample` file to `config.json`.
5. Configure the newly renamed `config.json` file, make sure to replace your `DISCORD_BOT_TOKEN`. *(See: [Configuration](#configuration))*
6. Build the [`docker`](https://www.docker.com/) container, from command line in the root directory of CleanChat ACC Docker: 
    ```bash
    # Build & tag the CleanChat-ACC container
    docker build --no-cache -t clean-chat-acc .
    ```

After the configuration you can run your container using:
```bash
# Run the CleanChat-ACC container with a custom name
docker run -it --name clean-chat-acc clean-chat-acc
```

### Dokku Installation
[`dokku`](https://dokku.com/) is an awesome tool to deploy software to [`docker`](https://www.docker.com/) containers hosted on a server,   
all with a simple `git push`!

**On your server:**
1. Make sure you have [`dokku`](https://dokku.com/) & [`docker`](https://www.docker.com/) installed on your server.
2. Create a new (empty) [`dokku`](https://dokku.com/) app using: `dokku app:create clean-chat-acc` *(Or any other name you like)*

**On your client PC:**
1. Make sure you have [`git`](https://git-scm.com/) installed on your client PC.
2. [Download](#downloads) the latest **CleanChat AutoClearChannel `Docker`**
3. Unzip the `.zip` package on your computer.
4. Copy & rename the `config.json.sample` file to `config.json`.
5. Configure the newly renamed `config.json` file, make sure to replace your `DISCORD_BOT_TOKEN`. *(See: [Configuration](#configuration))*
6. Initialize & configure a [`git`](https://git-scm.com/) repository from command line in the root directory of CleanChat ACC Docker:
    ```bash
    # Initialize a git repository
    git init
    # Connect your git repository to your remote dokku server (Replace <DOKKU_SERVER_IP> with yours)
    git remote add clean-chat-acc dokku@<DOKKU_SERVER_IP>:clean-chat-acc
    ```

After the configuration you can start to commit & push changes from your client to your [`dokku`](https://dokku.com/) server as following:
```bash
# Add all files (with changes) in the directory to the git repository
git add .
# Give your changes a proper name
git commit -m "⚡️ Updated `config.json`"
# Push & deploy the changes on your master branch to your dokku server
git push clean-chat-acc master
```

### Native Installation
1. Make sure you have **.NET Core 3.1** installed on your server:
    - [Linux](https://docs.microsoft.com/da-dk/dotnet/core/install/linux-package-manager-ubuntu-1910)
    - [Mac](https://dotnet.microsoft.com/download/dotnet-core/thank-you/runtime-3.1.3-macos-x64-installer)
    - [Windows](https://dotnet.microsoft.com/download/dotnet-core/thank-you/runtime-3.1.3-windows-x64-installer) *(Only if using `Portable`!)*
2. [Download](#downloads) the latest **CleanChat AutoClearChannel `Portable` or `Windows`**
3. Unzip the `.zip` package on your computer.
4. Copy & rename the `config.json.sample` file to `config.json`.
5. Configure the newly renamed `config.json` file, make sure to replace your `DISCORD_BOT_TOKEN`. *(See: [Configuration](#configuration))*
6. Run the execute-able from command line in the root directory of CleanChat ACC:
    - **Portable**: `dotnet CleanChat-AutoClearChannel.dll`
    - **Windows 64 & 32**: `CleanChat-AutoClearChannel.exe`


### Downloads
Latest version is: `v1.0.5.0`

| Version        | Download Link                                                                                                        |
| -------------- | -------------------------------------------------------------------------------------------------------------------- |
| **Docker**     | [CleanChat-AutoClearChannel-Docker-Latest](https://github.com/Rikj000/CleanChat-AutoClearChannel-Docker/releases)    |
| **Portable**   | [CleanChat-AutoClearChannel-v1.0.5.0-Portable-NetCore-3.1.zip](http://drive.alexandernorup.com/CleanChat/latest.zip) |
| **Windows 64** | [CleanChat-AutoClearChannel-v1.0.5.0-Win-x64.zip](http://drive.alexandernorup.com/CleanChat/latest-WINDOWS.zip)      |
| **Windows 32** | [CleanChat-AutoClearChannel-v1.0.5.0-Win-x86.zip](http://drive.alexandernorup.com/CleanChat/latest-WINDOWS-x86.zip)  |

The **Portable build** runs on all systems, but **requires .NET Core 3.1**.
For native Linux users, you can download a free [CleanChat-Auto-Updater-Script.sh](https://pastebin.com/nZL0pvQP) that will keep the bot updated.   
Download and save as `CleanChat-Auto-Updater-Script.sh`, and launch that when you run the server.

The **Windows builds** obviously only runs on Windows, however they **don't require .NET Core 3.1**.   
The drawback is then that the file-size is a lot bigger.


## Configuration
The bot is configured through the `config.json` file, placed in the same root directory as the execute-able.

The `config.json` file looks like as following, make sure to replace `DISCORD_BOT_TOKEN` with the bot-token of your Discord application:
```json
{
  "bottoken": "DISCORD_BOT_TOKEN",
  "statusText": "AutoClearChannel provider",
  "outputJsonLog": false
}
```

Here's a table of all the properties of the  `config.json` file:
| Property          | Value Type        | Description                                                                                    |
| ----------------- | ----------------- | ---------------------------------------------------------------------------------------------- |
| **bottoken**      | Discord Bot Token | Your token from the [Discord Developer Portal](https://discordapp.com/developers/applications) |
| **statusText**    | string            | What the bot will be apearing to be "playing"                                                  |
| **outputJsonLog** | boolean           | If set to true, the log will be displayed in JSON format                                       |


## Usage
Below you'll find a long list of commands.

If you click on a command,    
you'll be taken to an explanation of that command,   
along with use cases for set command.

All commands needs to start with you tagging your bot.   
This means you have to put `@YourBotName#1234` in front of every command, before it works!


### Commands
| Command                                 | Description                                             |
| --------------------------------------- | ------------------------------------------------------- |
| [`help`](#help)                         | Displays info about the usage of all available commands |
| [`autoclearchannel`](#autoclearchannel) | Automatically clean your channels                       |
| [`status`](#status)                     | Shows current settings                                  |
| [`reset`](#reset)                       | Resets settings                                         |
| [`forcepublicreply`](#forcepublicreply) | Answers to your commands in the channel instead of DM   |
| [`purge`](#purge)                       | Mass-delete commands                                    |


### `help`
Displays info about the usage of all available commands.

**Usage:**
```properties
@Bot help
```


### `autoclearchannel`

**Aliases:** `autoclearchat`, `acc`

This command can be used to automatically clear a channel after a specified time.

That means if you set it at 5 seconds,   
then the bot will delete every message after they have each spent 5 seconds in chat.

The delay is set in milliseconds or a "formatted time string"

"Formatted time strings" looks like this:
`2s` means "2 Seconds"
`5m1s` means "5 Minutes and 1 Second"
`10h6m10s` means "10 Hours, 6 Minutes and 10 seconds"
`2s500ms` means "2 Seconds and 500 Milliseconds"

So basically a number, and then a letter representing a time unit.
`ms` means "Milliseconds"
`s` means "Seconds"
`m` means "Minutes"
`h` means "Hours"
`d` means "Days"

If you want to remove a autoclearchannel again, you must either set the deletion delay to 0 or use [`reset`](#reset).

**Usage:**
```properties
@Bot autoclearchannel <#channel> <time in ms | formatted time string>
```
Show/hide argument information

Example of used correctly:
```properties
@Bot autoclearchannel #channel 5s
```


### `status`

Shows current configuration of the bot.

Usage:
```properties
@Bot status
```


### `reset`

The bot forgets everything about your server.   
Can be used if you want to start-over.

Usage:
```properties
@Bot reset
```


### `forcepublicreply`

**Aliases:** `fpr`

If enabled, the bot will always reply in chat, instead of in DM's.   
This feature is useful if you don't want people on your server to be able to DM you,   
but you still want to use the bot.

**Usage:**
```properties
@Bot forcepulicreply <true | false>
```
Show/hide argument information

Example of used correctly:
```properties
@Bot forcepublicreply true
```


### `purge`

**Aliases:** `p`

Will delete set number of messages from chat.   
You can only delete a maximum of 100 messages per command execution.

The bot will skip any pinned messages.

If a user is specified, the bot will only delete messages sent by that user.

**Filters:**
This command supports filters. The following filters are available:

| Filter       | Usage                 | Description                                               |
| ------------ | --------------------- | --------------------------------------------------------- |
| contains     | `contains:<string>`   | Deletes the message if it contains the <string>           |
| startswith   | `startswith:<string>` | Deletes the message if it starts with the <string>        |
| endswith     | `endswith:<string>`   | Deletes the message if it ends with the <string>          |
| withimage    |`withimage`            | Deletes the message if it has an image attached           |
| withoutimage | `withoutimage`        | Deletes the message if it does not have an image attached |
| regex        | `regex:<regex>`       | Deletes the message if it matches the <regex> (Advanced)  |

**Note:** The bot can only mass-delete messages that're under 14 days old.   
This is a limitation set by Discord, which I can't do anything about, even if I wanted.

**Usage:**
```properties
@Bot purge <number> [user | filter] [filter]
```

Show/hide argument information

Examples of used correctly:
```properties
@Bot purge 50

@Bot purge 25 @UserName#1234

@Bot purge 25 contains:banana
```


## Internet Archive - Clean Chat Backups
- [Clean Chat - Website Backup](https://web.archive.org/web/20220114101355/https://www.alexandernorup.com/CleanChat)
- [CleanChat-AutoClearChannel - Website Backup](https://web.archive.org/web/20220114101216/https://www.alexandernorup.com/CleanChatAutoClearChannel)
- [CleanChat-Auto-Updater - Script Backup](https://web.archive.org/web/20220114101500/https://pastebin.com/nZL0pvQP)