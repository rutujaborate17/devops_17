# $${\color{purpule}\textbf {Ansible}}$$
## $${\color{red}\textbf {Installation Steps For Amazon Linux:}}$$
````
sudo yum update
````
````
sudo yum install ansible
````
````
ansible --version
````
### create key-pair using ssh-keygen command
### copy public-key from master to authorized_keys file in node .ssh dir
## set up inventory file
````
sudo nano /etc/ansible/hosts
private-ip of node
````
## ping all nodes to test connection
````
ansible all -m ping
````
````
- name: update and install and nginx
  hosts: all
  become: true

  tasks:
   
  - name: Upgrade all packages
    yum:
     name: '*'
     state: latest
      
  - name: Install the latest version of nginx
    yum:
     name: nginx
     state: latest
      
  - name: Start nginx
    service:
     name:  nginx
     state: started
     enabled: true
````

## run playbook
````
ansible-playbook nginx.yaml
````
## $${\color{red}\textbf {Installation Steps For Ubuntu:}}$$
## Installation
````
sudo apt-add-repository ppa:ansible/ansible
````
````
sudo apt update
````
````
sudo apt install ansible
````
````
ansible --version
````
## Set up inventory file
````
sudo nano /etc/ansible/hosts
private-ip of instance
````
## edit ansible.cfg
````
[defaults]
inventory = hosts
host_key_checking = False
````
## ping all nodes to test connection
````
ansible all -m ping
````
````
- name: update and install and nginx
  hosts: all
  become: true

  tasks:
   
  - name: Upgrade all packages
    apt:
     name: '*'
     state: latest
      
  - name: Install the latest version of nginx
    apt:
     name: nginx
     state: latest
      
  - name: Start nginx
    service:
     name:  nginx
     state: started
     enabled: true
````
## run playbook
````
ansible-playbook playbook.yaml
````
