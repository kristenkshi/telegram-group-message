#!/bin/bash

# Check the number of arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <GROUP_NAME> <PHONE_NUMS_CSV_FILE> <MESSAGE_FILE>"
  exit 1
fi

# Assign arguments to variables
group_name="$1"
phone_nums_csv_file="$2"
message_file="$3"

# Check if both files exist
if [ ! -f "$phone_nums_csv_file" ]; then
  echo "Error: Phone numbers CSV file '$phone_nums_csv_file' not found."
  exit 1
fi

if [ ! -f "$message_file" ]; then
  echo "Error: Message file '$message_file' not found."
  exit 1
fi

# Read the message file content
message=$(<"$message_file")

# Function to send group message to multiple phone numbers
function send_group_message {
  local group_name="$1"
  local phone_numbers="$2"

  # Use telegram-cli to send the group message
  echo "Sending group message with group name '$group_name' to phone numbers '$phone_numbers'..."
  telegram-cli -W -e "add_contact $group_name $phone_numbers" >/dev/null
  telegram-cli -W -e "msg $group_name \"$message\""
}

# Read the Phone Numbers CSV file line by line
while IFS= read -r phone_number; do
  # Skip empty lines
  if [[ -n "$phone_number" ]]; then
    # Append phone numbers to a string separated by commas
    if [[ -z "$phone_numbers_str" ]]; then
      phone_numbers_str="$phone_number"
    else
      phone_numbers_str="$phone_numbers_str,$phone_number"
    fi
  fi
done < "$phone_nums_csv_file"

# Send the group message with all phone numbers
send_group_message "$group_name" "$phone_numbers_str"
