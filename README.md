# CleanChat-AutoClearChannel
***A self-hosted Discord bot***

CleanChat AutoClearChannel *(ACC for short)*, is a simple self-hosted Discord bot which can automatically delete messages after a certain delay in a channel.   
It also includes a purge command for easily purging loads of messages really quickly. The bot itself is a replacement for the AutoClearChannel in CleanChat.

Here is a [small tutorial video](https://yewtu.be/watch?v=hTeU351TFck) showing what AutoClearChannel can do, and how to make a server via the hosting service with no prior knowlegde of the bot.

## Hosting
**The bot is self-hosted meaning that you will have to host it yourself!**

## Install instructions:
1. Have .NET Core 3.1 installed on your server:
    - Windows: ONLY if using PORTABLE: https://dotnet.microsoft.com/download/dotnet-core/thank-you/runtime-3.1.3-windows-x64-installer
    - Mac: https://dotnet.microsoft.com/download/dotnet-core/thank-you/runtime-3.1.3-macos-x64-installer
    - Linux: https://docs.microsoft.com/da-dk/dotnet/core/install/linux-package-manager-ubuntu-1910
2. Download the package: [Downloads](https://www.alexandernorup.com/CleanChatAutoClearChannel#downloads).
3. Unzip the package on your computer.
4. Go to the Discord Developer Portal and: 
    - Create a new application: https://discordapp.com/developers/applications
    - Go to Bot
        - Click add bot
        - Disable `public bot`
        - Enable all `Privileged Gateway Intents`
    - Go to OAuth => URL Generator
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
5. Copy `config.json.sample` to `config.json` and fill in the config file.
    See Configuration for help.
6. Run the executeable:
    - Portable: Run in commandline: `dotnet CleanChat-AutoClearChannel.dll`
    - Windows: `CleanChat-AutoClearChannel.exe`

## Downloads
Download latest version:
Latest version is: 1.0.5.0

- Portable: [CleanChat-AutoClearChannel-v1.0.5.0-Portable-NetCore-3.1.zip](http://drive.alexandernorup.com/CleanChat/latest.zip)
- Windows 64: [CleanChat-AutoClearChannel-v1.0.5.0-Win-x64.zip](http://drive.alexandernorup.com/CleanChat/latest-WINDOWS.zip)
- Windows 32: [CleanChat-AutoClearChannel-v1.0.5.0-Win-x86.zip](http://drive.alexandernorup.com/CleanChat/latest-WINDOWS-x86.zip)

The WINDOWS build obviously only runs on Windows, but dosn't require .NET Core 3.1.   
The drawback is then that the filesize is a lot bigger.

The PORTABLE build runs on all systems, but requires .NET Core 3.1.
For Linux users, you can download a free [CleanChat-Auto-Updater-Script.sh](https://pastebin.com/nZL0pvQP) that will keep the bot updated.   
Download and save as `CleanChat-Auto-Updater-Script.sh`, and launch that when you run the server.


## Configuration
The bot is configured through the `config.json` file, placed in the same root directory as the executeable.

The config file looks like this:

Here's a table of all the properties in the file:
| Property | Value Type | Descrption |
| -------- | ---------- | ---------- |
| bottoken | Discord Bot Token |Your token from the [Discord Developer Portal](https://discordapp.com/developers/applications) |
| statusText | string | What the bot will be apearing to be "playing" |
| outputJsonLog | boolean | If set to true, the log will be displayed in JSON format |

## Usage
Below you'll find a long list of commands. If you click on a command, you'll be taken to an explanation of that command, along with use cases for set command.

All commands needs to start with you tagging your bot.
This means you have to put `@YourBotName#1234` in front of every command, before it works!

## Commands
| Command | Description |
| ------- | ----------- |
| `help` | Displays info about the usage of all available commands |
| `autoclearchannel` | Automatically clean your channels |
| `status` | Shows current settings |
| `reset` | Resets settings |
| `forcepublicreply` | Answers to your commands in the channel instead of DM |
| `purge` | Mass-delete commands |

### `help`
Displays info about the usage of all available commands 

**Usage:**
```properties
@Bot help
```

### `autoclearchannel`

**Aliases:** `autoclearchat`, `acc`

This command can be used to automatically clear a channel after a specified time.

That means if you set it at 5 seconds, then the bot will delete every message after they have each spent 5 seconds in chat.

The delay is set in milliseconds or a "formatted time string"

"Formatted time strings" looks like this:
"2s" means "2 Seconds"
"5m1s" means "5 Minutes and 1 Second"
"10h6m10s" means "10 Hours, 6 Minutes and 10 seconds"
"2s500ms" means "2 Seconds and 500 Milliseconds"

So basically a number, and then a letter representing a time unit.
"ms" means "Milliseconds"
"s" means "Seconds"
"m" means "Minutes"
"h" means "Hours"
"d" means "Days"

If you want to remove a autoclearchannel again, you must set the deletion delay to 0.

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

| Filter | Usage | Description |
| ------ | ----- | ----------- |
| contains | `contains:<string>` | Deletes the message if it contains the <string> |
| startswith | `startswith:<string>` | Deletes the message if it starts with the <string> |
| endswith | `endswith:<string>` | Deletes the message if it ends with the <string> |
| withimage |`withimage` | Deletes the message if it has an image attached |
| withoutimage | `withoutimage` | Deletes the message if it does not have an image attached |
| regex | `regex:<regex>` | Deletes the message if it matches the <regex> (Advanced) |

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

@Bot purge 25 @AlexanderNorup#4981

@Bot purge 25 contains:banana
```

# Internet Archive - Clean Chat Backups:
- [Clean Chat - Website Backup](https://web.archive.org/web/20220114101355/https://www.alexandernorup.com/CleanChat)
- [CleanChat-AutoClearChannel - Website Backup](https://web.archive.org/web/20220114101216/https://www.alexandernorup.com/CleanChatAutoClearChannel)
- [CleanChat-Auto-Updater - Script Backup](https://web.archive.org/web/20220114101500/https://pastebin.com/nZL0pvQP)