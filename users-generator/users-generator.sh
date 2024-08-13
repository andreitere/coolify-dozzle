#!/bin/bash

# Define the output file path
USERS_YAML=/data/users.yaml

# Initialize the users.yaml file
echo "users:" > $USERS_YAML

# Split the DOZZLE_USERS and DOZZLE_PASSWORDS into arrays
IFS="," read -ra USERS <<< "$DOZZLE_USERS"
IFS="," read -ra PASSWORDS <<< "$DOZZLE_PASSES"

# Check if the number of users matches the number of passwords
if [ ${#USERS[@]} -ne ${#PASSWORDS[@]} ]; then
  echo "Error: The number of users and passwords must match."
  exit 1
fi

# Loop through users and passwords and append them to the YAML file
for i in "${!USERS[@]}"; do
  echo "  - username: ${USERS[i]}" >> $USERS_YAML
  echo "    password: ${PASSWORDS[i]}" >> $USERS_YAML
done

echo "Generated users.yaml with ${#USERS[@]} users."