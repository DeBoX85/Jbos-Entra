𝐀𝐮𝐭𝐨𝐦𝐚𝐭𝐞 𝐄𝐦𝐚𝐢𝐥 𝐍𝐨𝐭𝐢𝐟𝐢𝐜𝐚𝐭𝐢𝐨𝐧𝐬 𝐟𝐨𝐫 𝐂𝐞𝐫𝐭𝐢𝐟𝐢𝐜𝐚𝐭𝐞/𝐒𝐞𝐜𝐫𝐞𝐭 𝐄𝐱𝐩𝐢𝐫𝐲 𝐢𝐧 𝐄𝐧𝐭𝐚 𝐀𝐩𝐩.

https://o365reports.com/2025/04/29/send-entra-app-credential-expiry-notifications/

### Script highlights

- Sends Entra app credential expiry notifications to specific users.
- Sends notifications for expiring certificates alone, client secrets alone, or both.
- Exports a list of apps with expiring credentials within the specified days in CSV format.
- Allows sending emails on behalf of other users.
- Automatically installs the Microsoft Graph PowerShell module (if not installed already) upon your confirmation.
- Can be executed with MFA and non-MFA accounts.
- Supports execution with certificate-based authentication (CBA).
- Scheduler-friendly script.


# Entra ID App Credentials Expiry Notifications

This repository provides a PowerShell script to send email alerts for expiring credentials of Entra ID-registered apps in Microsoft 365.


----



## Overview

The script helps identify applications whose **client secrets** or **certificates** are about to expire and sends notifications to specified recipients. This enables proactive management of app credentials to avoid unexpected disruptions.


----



## Features

- Detect app credentials expiring within a specified number of days
- Supports both MFA and non-MFA accounts
- Supports certificate-based authentication for unattended automation
- Sends detailed email notifications with app and credential information
- Can be scheduled with Windows Task Scheduler for automatic alerts


----



## Prerequisites

- PowerShell installed on the system
- Permissions to access Entra ID (Azure AD) apps and credentials
- Email account to send notifications from (especially for certificate auth)


----



# Microsoft 365 App Credentials Expiry Notifications

This guide explains how to set up email alerts for expiring credentials (client secrets or certificates) of Entra ID-registered apps using a PowerShell script.

---

## Getting Started

### Download and Prepare the Script

1. **Download** the script [`AppCertsAndSecretsExpiryNotification.ps1`](./AppCertsAndSecretsExpiryNotification.ps1).
2. Open **Windows PowerShell**.

---

## Executing the Script

You can execute the script using either MFA/non-MFA or certificate-based authentication.

### Method 1: Using MFA or Non-MFA Account

Run the following command:

```powershell
.\AppCertsAndSecretsExpiryNotification.ps1 -SoonToExpireInDays 10 -Recipients 'amy@contoso.com, benucia@contoso.com'
```

This command sends email alerts to specified recipients about applications whose credentials expire within the next 10 days. The email includes:

* Application Name
* Credential Type (Client Secret or Certificate)
* Credential Name
* Credential Creation Time
* Credential Expiry Date

**Note:** Email notifications are sent only upon script execution. To maintain notifications, execute the script regularly.

### Method 2: Using Certificate-based Authentication

For certificate-based authentication, register an app in Entra ID and use either a certificate authority (CA) or a self-signed certificate.

Execute the script with this command:

```powershell
.\AppCertsAndSecretsExpiryNotification.ps1 -SoonToExpireInDays 10 -TenantId <TenantId> -ClientId <ClientId> -CertificateThumbprint <CertificateThumbprint> -FromAddress jack@contoso.com -Recipients 'amy@contoso.com'
```

**Note:** The `FromAddress` parameter is required when using certificate-based authentication.

---

## Automating Credential Expiry Notifications

To automate notifications, schedule the PowerShell script execution using Task Scheduler:

### Setting up the Scheduled Task

1. Open **Task Scheduler**.
2. Click **Create Task…** under the Task Scheduler Library.
3. Provide a **Name** and **Description**.
4. Under **Security Options**:

   * Select the user account.
   * Choose either:

     * `Run whether user is logged on or not` (recommended for background execution)
     * `Run only when user is logged on` (for interactive execution)
   * Check `Run with highest privileges`.

### Configuring Triggers

1. Go to **Triggers** tab and click **New…**.
2. Configure the trigger:

   * Set **Begin the task** to `On a schedule`
   * Under **Settings**, choose `Monthly`
   * Select `<All months>` and choose `1st` from the **Days** dropdown.
   * Adjust **Advanced Settings** as needed and click **OK**.

### Configuring Actions

1. Navigate to the **Actions** tab, click **New…**.
2. Set the **Action** to `Start a program`.
3. Click **Browse** and select:

```
C:\Windows\System32\WindowsPowerShell\v1.0\PowerShell.exe
```

4. In the **Add arguments (optional)**, enter:

```powershell
<ScriptPath>\AppCertsAndSecretsExpiryNotification.ps1 -TenantId <TenantId> -ClientId <ClientId> -CertificateThumbprint <Certthumbprint> -SoonToExpireInDays 30 -FromAddress jack@contoso.com -Recipients 'amy@contoso.com, benucia@contoso.com'
```

5. Configure additional conditions as necessary, then click **OK** to finalize.

---

Once set, this scheduled task runs automatically on the 1st of every month, notifying recipients about upcoming credential expirations.

---

## Advanced Usage

### Send Notifications for Expiring Certificates Only

If your organization relies heavily on certificate-based authentication and you want notifications only for expiring certificates, schedule the script with `-CertificatesOnly`:

```powershell
<ScriptPath>\AppCertsAndSecretsExpiryNotification.ps1 -TenantId <TenantId> -ClientId <ClientId> -CertificateThumbprint <Certthumbprint> -SoonToExpireInDays 7 -FromAddress jack@contoso.com -CertificatesOnly -Recipients 'amy@contoso.com, benucia@contoso.com'
```

Schedule this weekly (e.g., every Sunday).

### Send Notifications for Expiring Client Secrets Only

To notify users about expiring client secrets only, use `-ClientSecretsOnly`:

```powershell
<ScriptPath>\AppCertsAndSecretsExpiryNotification.ps1 -TenantId <TenantId> -ClientId <ClientId> -CertificateThumbprint <Certthumbprint> -SoonToExpireInDays 30 -FromAddress jack@contoso.com -ClientSecretsOnly -Recipients 'amy@contoso.com, benucia@contoso.com'
```

Schedule this monthly.

### Export Reports for Apps with Expiring Credentials

To store reports locally, add the `-StoreReportLocally` parameter:

```powershell
<ScriptPath>\AppCertsAndSecretsExpiryNotification.ps1 -TenantId <TenantId> -ClientId <ClientId> -CertificateThumbprint <Certthumbprint> -SoonToExpireInDays 20 -FromAddress jack@contoso.com -Recipients 'amy@contoso.com, benucia@contoso.com' -StoreReportLocally
```

### Send Notifications from a Specific Email Address

To send emails from another user's mailbox, ensure proper permissions (`Send As`, `Full Access`) and use:

```powershell
.\AppCertsAndSecretsExpiryNotification.ps1 -SoonToExpireInDays 30 -FromAddress jack@contoso.com -Recipients 'amy@contoso.com, benucia@contoso.com'
```

---

## Additional Notes

Ensure the PowerShell execution policy allows scripts:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
