# Telegram Group Message

This is a simplified shell script that sends a Telegram group chat message to a list of Telegram phone numbers. It uses [`telegram-cli`](https://github.com/vysheng/tg) underneath the hood.


## Setup

* Install the `telegram-cli` tool based on the instructions on the [project page](https://github.com/vysheng/tg).
* Clone this repository by running `git clone https://github.com/kristenkshi/telegram-group-message.git`.


## Sending a Group Message

* To send a Telegram group message, ensure that the recipients' Telegram phone numbers are in a CSV file.
* Also ensure that the text message is in a file.
* The Telegram group chat name, phone number CSV file, and message file are all passed in as shell command line arguments.
* To send the message, run the following:

```bash
./telegram-group-message.sh <GROUP_NAME> <PHONE_NUMS_CSV_FILE> <MESSAGE_FILE>
```
