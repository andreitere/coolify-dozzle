import os
import hashlib
import yaml

# Read environment variables
users = os.getenv("DOZZLE_USERS", "admin").split(",")
passwords = os.getenv("DOZZLE_PASSWORDS", "dozzledozzle").split(",")
emails = os.getenv("DOZZLE_EMAILS", "admin@example.com").split(",")

# Check if the number of users, passwords, and emails match
if len(users) != len(passwords) or len(users) != len(emails):
    raise ValueError("The number of users, passwords, and emails must match.")

# Prepare user data
user_data = {}
for username, password, email in zip(users, passwords, emails):
    # Hash the password using SHA-256
    password_hash = hashlib.sha256(password.encode()).hexdigest()
    user_data[username] = {
        "name": username.capitalize(),
        "password": password_hash,
        "email": email,
    }

# Define the output file path
output_file = "/data/users.yml"

# Write user data to YAML file
with open(output_file, "w") as file:
    yaml.dump({"users": user_data}, file, default_flow_style=False)

print(f"Generated users.yml with {len(user_data)} users.")
