# Firewall rules

- [Firewall rules](#firewall-rules)
  - [Windows](#windows)
    - [SMB File share](#smb-file-share)
    - [Active Directory (AD) access](#active-directory-ad-access)

## Windows

### SMB File share

For the actual file sharing:

- 445/TCP

Optional for NetBios/Name resolution:

- 137-138/UDP
- 139/TCP

([Source](https://serverfault.com/a/346197))

### Active Directory (AD) access

| Client Port(s)        | Server Port    | Service                        |
| --------------------- | -------------- | ------------------------------ |
| 1024-65535/TCP        | 135/TCP        | RPC Endpoint Mapper            |
| 1024-65535/TCP        | 1024-65535/TCP | RPC for LSA, SAM, NetLogon (*) |
| 1024-65535/TCP/UDP    | 389/TCP/UDP    | LDAP                           |
| 1024-65535/TCP        | 636/TCP        | LDAP SSL                       |
| 1024-65535/TCP        | 3268/TCP       | LDAP GC                        |
| 1024-65535/TCP        | 3269/TCP       | LDAP GC SSL                    |
| 53,1024-65535/TCP/UDP | 53/TCP/UDP     | DNS                            |
| 1024-65535/TCP/UDP    | 88/TCP/UDP     | Kerberos                       |
| 1024-65535/TCP        | 445/TCP        | SMB                            |
| 1024-65535/TCP        | 1024-65535/TCP | FRS RPC (*)                    |

([Source](https://docs.microsoft.com/en-us/troubleshoot/windows-server/identity/config-firewall-for-ad-domains-and-trusts))
