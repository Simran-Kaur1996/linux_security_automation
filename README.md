# 🛡️ Linux System Security & Automation Toolkit

A comprehensive shell-based Linux toolkit designed to automate essential system administration tasks such as user and group management, directory permissions, ACL setup, system backups, log monitoring, and basic security hardening. Ideal for showcasing real-world Linux skills required in DevOps, Cloud, or SysAdmin roles.

---

## 📌 About the Project

This project simulates a multi-user Linux environment often found in corporate IT or cloud infrastructure teams. It automates the process of:

- Creating secure user and group structures
- Enforcing permission and ACL policies
- Archiving project directories using `tar` and `gzip`
- Automating system cleanups using `cron`
- Monitoring security logs for suspicious activity
- Enhancing system security with `umask`, `sudo`, and directory protections

> 🔧 Built entirely in Bash, the toolkit reflects industry best practices for Linux system administration.

---

## ✨ Features

- 🔐 **User & Group Automation** — Bulk creation and role-based group assignments  
- 📁 **Secure Directory Setup** — Proper `chmod` permissions for team folders  
- 🛂 **Access Control Lists (ACLs)** — Fine-grained file access with `setfacl`  
- 💾 **Automated Backups** — Timestamped archives of important directories  
- ⏲️ **Scheduled Cleanup** — Cron jobs to clean stale files in `/tmp`  
- 📊 **Log Monitoring** — Extract failed/successful login attempts from `auth.log`  
- 📃 **System Reports** — Disk usage and user list reports for auditing  
- 🧰 **Security Enhancements** — Basic hardening like `umask` and limited `sudo`

---

