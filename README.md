This PowerShell script is designed to be used as part of an Intune Detection and Remediation deployment to support Windows Local Administrator Password Solution (LAPS) configuration via an Intune configuration profile.
🎯 Purpose
Windows LAPS requires a managed local administrator account to exist on the device. This script ensures that a predefined local admin account is:

✅ Present on the device
✅ Member of the local Administrators group
✅ Ready for LAPS password management via Intune

If the account is missing or not properly configured, the remediation script creates or fixes it automatically.

🔍 How It Works
The script performs the following logic, Checks whether a specific local user account exists

1) If the account does not exist:

* Creates the local user
* Assigns a temporary password
* Adds the user to the local Administrators group


2) If the account exists but is not an administrator:

* Adds the account to the Administrators group



This ensures compliance before LAPS enforcement and is intended to be used with:


Intune Detection Script
→ Detects whether the required local admin account exists and is correctly configured


Intune Remediation Script
→ Creates or corrects the local admin account if detection fails


Intune LAPS Configuration Profile
→ Takes over password rotation and secure storage once the account exists


🛠 Requirements

* Windows 10 / 11 (LAPS supported versions)
* Microsoft Intune–managed device
* Script runs in SYSTEM context
* Windows LAPS enabled via Intune policy

🔐 Security Notes

The password used in this script is intended as a temporary bootstrap password only
Once LAPS is active, the password will be:

Automatically rotated, Encrypted and Stored securely in Azure AD / Entra ID



👤 Intended Audience

* Endpoint & Intune Administrators
* Security & Identity Teams
* Enterprise IT Operations

📌 Use Case
This script is ideal for environments where:

Devices were deployed before LAPS enforcement
Local admin accounts are inconsistent or missing
LAPS rollout requires guaranteed account presence# Intune-LAPS
part of an Intune deployment to support Windows (LAPS)
