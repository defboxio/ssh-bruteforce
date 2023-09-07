1. change `inventory.yaml` with outputs from terraform 
2. Change `/templates/auditbeat` with creds to your elastic 
3. `ansible-playbook  -i inventory.yaml --key-file ../infra/sample_keys/id_ed25519 -u root install_auditbeat.yaml`
4. `ansible-playbook  -i inventory.yaml --key-file ../infra/sample_keys/id_ed25519 -u root set_up_password.yaml`
5. `ansible-playbook  -i inventory.yaml --key-file ../infra/sample_keys/id_ed25519 -u root hack_the_ssh.yaml`