#!/bin/bash

INVENTORY_FILE="inventory.ini"

if [ ! -f "$INVENTORY_FILE" ]; then
  echo "Error: Inventory file '$INVENTORY_FILE' not found!"
  exit 1
fi

echo "Testing Ansible connection to webservers..."

ansible -i "$INVENTORY_FILE" webservers -m ping

if [ $? -eq 0 ]; then
  echo "Ansible successfully connected to the VM."
else
  echo "Ansible failed to connect to the VM."
  exit 1
fi
