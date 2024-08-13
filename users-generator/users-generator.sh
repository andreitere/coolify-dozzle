#!/bin/bash

# Define the output file path
USERS_YAML=/data/users.yml

# Initialize the users.yaml file
echo "users:" > "$USERS_YAML"

# Split the DOZZLE_USERS, DOZZLE_PASSWORDS, and DOZZLE_EMAILS into arrays
IFS="," read -ra USERS <<< "$DOZZLE_USERS"
IFS="," read -ra PASSWORDS <<< "$DOZZLE_PASSWORDS"
IFS="," read -ra EMAILS <<< "$DOZZLE_EMAILS"

# Check if the number of users matches the number of passwords and emails
if [ ${#USERS[@]} -ne ${#PASSWORDS[@]} ] || [ ${#USERS[@]} -ne ${#EMAILS[@]} ]; then
  echo "Error: The number of users, passwords, and emails must match."
  exit 1
fi

# Loop through users, passwords, and emails and append them to the YAML file
for i in "${!USERS[@]}"; do
  USERNAME=${USERS[i]}
  PASSWORD_HASH=$(echo -n "${PASSWORDS[i]}" | sha256sum | awk '{print $1}')
  EMAIL=${EMAILS[i]}

  echo "  ${USERNAME}:" >> "$USERS_YAML"
  echo "    name: \"${USERNAME^}\"" >> "$USERS_YAML" # Capitalize the first letter
  echo "    password: \"${PASSWORD_HASH}\"" >> "$USERS_YAML"
  echo "    email: \"${EMAIL}\"" >> "$USERS_YAML"
done

echo "Generated users.yml with ${#USERS[@]} users."