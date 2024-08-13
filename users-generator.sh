USERS_YAML=/data/users.yaml;
echo "users:" > $USERS_YAML;
IFS="," read -ra USERS <<< "$DOZZLE_USERS";
IFS="," read -ra PASSWORDS <<< "$DOZZLE_PASSWORDS";

for i in "${!USERS[@]}"; do
    echo "  - username: ${USERS[i]}" >> $USERS_YAML;
    echo "    password: ${PASSWORDS[i]}" >> $USERS_YAML;
done