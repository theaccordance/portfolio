# Secrets Management

## Outline
- When it comes to secrets management, the ideal solution involves
  - Security:  The secrets should only be visible to myself and when applications need them at runtime
  - Accessible:  I should be able to easily update secrets
  - Single Source of Truth:  I want to be able to update my secret once, and have that change applied to downstream services (Heroku, Digital Ocean, Vercel).  
- 1Password
  - Been my personal password tool for a decade now, it's one of the core tools around my digital experience
  - It has a lot of developer options for using it as a store for secrets
    - CLI
    - VS Code Extension
    - Connect Server 
- My Secrets Setup
  - Using my personal 1Password Account, I set up a vault dedicated to my developer domain secrets
  - 
