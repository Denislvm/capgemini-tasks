#!/bin/bash
pip3 install -r requirements.txt

ansible-playbook list_resource_groups.yml --ask-vault-pass