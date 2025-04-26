# Apache Web Server Setup - Ansible Playbook

This Ansible playbook automates the setup of an Apache web server with PHP on a remote Ubuntu server. It simplifies the deployment process by handling package installation, timezone configuration, service management, and sample content deployment.

## Features

* Installs Apache2 and PHP packages
* Updates the APT package cache
* Sets the server timezone to **Africa/Lagos**
* Ensures the Apache service is running and enabled on boot
* Creates a sample `index.php` page showing the current server time

## Requirements

* Ansible 2.9+ installed locally
* SSH access to the remote server
* A valid private key for SSH authentication
* Remote server should be running **Ubuntu** (preferably 20.04 or later)

## Installation

1. Clone or download this repository to your local machine:
   ```
   git clone https://github.com/Godwin-T/apache-ansible-playbook.git
   ```
   
2. Navigate to the playbook directory:
   ```
   cd apache-ansible-playbook
   ```

3. Configure your inventory file to specify target hosts.

## Usage

Run the playbook using the following command:

```
ansible-playbook -i host-inventory tasks.yml
```

[!setup]("./assets/setup.png")

You can also specify a different inventory file:

```
ansible-playbook -i custom_inventory apache-setup.yml
```

## Playbook Structure

```
apache-ansible-playbook/
├── tasks.yaml                # Main playbook file
├── host-inventory            # Default inventory file
└── ansible.cfg               # ansible configuration
```

## Playbook Tasks Overview

The playbook performs the following tasks in sequence:

1. Update apt package cache
2. Install apache2 and php packages
3. Set the system timezone to Africa/Lagos
4. Start and enable the Apache service
5. Deploy an index.php file to /var/www/html/

[!tasks]("./assets/playbook.png)

## Customization

### Changing the Timezone

To use a different timezone, modify the `timezone` variable in the playbook file:

```yaml
vars:
  timezone: "Your/Timezone"
```

## Verification

After running the playbook, verify the installation by:

1. Checking if Apache is running:
   ```
   systemctl status apache2
   ```

2. Accessing the web server in a browser:
   ```
   http://your-server-ip/
   ```
[!page]("/assests/page.png")
