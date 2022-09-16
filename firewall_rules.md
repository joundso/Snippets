# Firewall rules

- [Firewall rules](#firewall-rules)
  - [Windows](#windows)
    - [SMB File share](#smb-file-share)

## Windows

### SMB File share

- TCP 445 (for the actual file sharing)
- UDP 137 + 138 (for NetBios/Name resolution)
- TCP 139 (for NetBios/Name resolution)

([Source](https://serverfault.com/a/346197))