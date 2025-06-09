#!/bin/bash
# linux_security_toolkit.sh
# Linux System Security & Automation Toolkit
# Author: Simranjeet Kaur Sudan

### 1. Create Users and Groups ###

echo "Creating users and groups..."
groupadd dev_team
groupadd marketing_team
groupadd design_team

useradd -m -G dev_team lead_dev
useradd -m -G marketing_team lead_marketing
useradd -m -G design_team lead_design

useradd -m dev_user1
useradd -m marketing_user1
useradd -m design_user1

usermod -aG dev_team dev_user1
usermod -aG marketing_team marketing_user1
usermod -aG design_team design_user1

### 2. Setup Directories with Proper Permissions ###

echo "Setting up project directories..."
mkdir -p /company/projects/{dev,marketing,design,common}

chown lead_dev:dev_team /company/projects/dev
chmod 2770 /company/projects/dev

chown lead_marketing:marketing_team /company/projects/marketing
chmod 2770 /company/projects/marketing

chown lead_design:design_team /company/projects/design
chmod 2770 /company/projects/design

chown root:root /company/projects/common
chmod 777 /company/projects/common

### 3. Set ACLs for Fine-Grained Access ###

echo "Applying ACLs..."
useradd auditor
setfacl -m u:auditor:rx /company/projects/common
setfacl -d -m g::rwx /company/projects/common
setfacl -d -m o::--- /company/projects/common

### 4. Backup Important Files ###

echo "Archiving project folders..."
mkdir -p /backups

tar -czf /backups/dev_backup_$(date +%F).tar.gz /company/projects/dev
tar -czf /backups/marketing_backup_$(date +%F).tar.gz /company/projects/marketing
tar -czf /backups/design_backup_$(date +%F).tar.gz /company/projects/design

### 5. Schedule Cleanup Script with Cron ###

echo "Creating cleanup script..."
echo "#!/bin/bash
find /tmp -type f -mtime +7 -exec rm -f {} \;" > /usr/local/bin/cleanup_tmp.sh
chmod +x /usr/local/bin/cleanup_tmp.sh

echo "0 2 * * * root /usr/local/bin/cleanup_tmp.sh" > /etc/cron.d/cleanup_tmp

### 6. Log Monitoring ###

echo "Monitoring auth logs..."
grep "Failed password" /var/log/auth.log | tee /var/log/failed_login_report.txt
grep "Accepted password" /var/log/auth.log | tee /var/log/successful_login_report.txt

### 7. Security Enhancements ###

echo "Applying basic security settings..."
umask 027
chmod 700 /home/*
echo "Defaults use_pty" >> /etc/sudoers.d/hardening

### 8. Generate User and Disk Reports ###

echo "Generating user report..."
cut -d: -f1 /etc/passwd > /var/log/user_list.txt

echo "Generating disk usage report..."
du -sh /company/projects/* > /var/log/disk_usage_report.txt

### 9. Notify Admin (optional - placeholder) ###

echo "Sending report to admin@example.com (placeholder)..."
echo "Security audit completed" | mail -s "Linux Toolkit Report" admin@example.com

### DONE ###
echo "Toolkit setup complete."
exit 0
