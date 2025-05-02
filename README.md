# Jbos-Entra
Just a bunch of scripts Entra

(Work in progress)

### Overview of Scripts in the Repository

1. **AccessToken TTL.ps1**
   - **Description**: Creates an Azure AD policy to set access token lifetimes and assigns it to a service principal.
   - **Location**: Root directory
   - [View Script](https://github.com/DeBoX85/Jbos-Entra/blob/main/AccessToken%20TTL.ps1)

2. **Delete Azure App Registration.ps1**
   - **Description**: Deletes an Azure App Registration using Microsoft Graph API.
   - **Location**: Root directory
   - [View Script](https://github.com/DeBoX85/Jbos-Entra/blob/main/Delete%20Azure%20App%20Registration.ps1)

3. **Check all subs for X permission.ps1**
   - **Description**: Checks all subscriptions in a tenant for users with specific roles, such as "Owner."
   - **Location**: Root directory
   - [View Script](https://github.com/DeBoX85/Jbos-Entra/blob/main/Check%20all%20subs%20for%20X%20permision.ps1)

4. **Get-AzADAppExpiringCredentials.ps1**
   - **Description**: Checks Azure AD applications for expiring credentials and categorizes them by status.
   - **Location**: Root directory
   - [View Script](https://github.com/DeBoX85/Jbos-Entra/blob/main/Get-AzADAppExpiringCredentials.ps1)

5. **Get-AzureAppGatewayExpiringCertificates.ps1**
   - **Description**: Identifies expiring SSL certificates in Azure Application Gateways.
   - **Location**: Root directory
   - [View Script](https://github.com/DeBoX85/Jbos-Entra/blob/main/Get-AzureAppGatewayExpiringCertificates.ps1)

6. **Inactive M365 User Report.ps1**
   - **Description**: Generates a report of inactive M365 users based on sign-in activity.
   - **Location**: `M365/M365 User Report/`
   - [View Script](https://github.com/DeBoX85/Jbos-Entra/blob/main/M365/M365%20User%20Report/Inactive%20M365%20User%20Report.ps1)

7. **Get user permissions per Sub in tenant - Simple v2.ps1**
   - **Description**: Retrieves user permissions per subscription in a tenant and displays them in a table.
   - **Location**: Root directory
   - [View Script](https://github.com/DeBoX85/Jbos-Entra/blob/main/Get%20user%20permissions%20per%20Sub%20in%20tenant%20-%20Simple%20v2.ps1)

8. **Get user permissions per Sub in tenant - writes to CSV.ps1**
   - **Description**: Retrieves user permissions per subscription in a tenant and writes them to a CSV file.
   - **Location**: Root directory
   - [View Script](https://github.com/DeBoX85/Jbos-Entra/blob/main/Get%20user%20permissions%20per%20Sub%20in%20tenant%20-%20writes%20to%20CSV.ps1)

9. **M365UserOffBoarding.ps1**
   - **Description**: Automates the offboarding process for Microsoft 365 users by performing multiple actions.
   - **Location**: `M365/Automate Microsoft 365 User Offboarding/`
   - [View Script](https://github.com/DeBoX85/Jbos-Entra/blob/main/M365/Automate%20Microsoft%20365%20User%20Offboarding/M365UserOffBoarding.ps1)

10. **Check all subs for X permission with CSV export.ps1**
    - **Description**: Similar to "Check all subs for X permission" but exports the results to a CSV file.
    - **Location**: Root directory
    - [View Script](https://github.com/DeBoX85/Jbos-Entra/blob/main/Check%20all%20subs%20for%20X%20permision%20with%20CSV%20export.ps1)

---

Entra Folder

Repository Overview
1. Entra App Registrations with Expiring Client Secrets and Certificates
Location: entra/Entra App Registrations with Expiring Client Secrets and Certificates
Scripts:
AppRegistrationsWithExpiringCertAndSecrets.ps1: Script for identifying Entra app registrations with expiring client secrets and certificates.
readme.md: Documentation and details about the script.
2. Reporting on Entra ID Integrated Applications
Location: entra/Reporting on Entra ID integrated applications
Scripts:
app_Permissions_inventory_GraphAPI.ps1: Generates a permissions inventory using Graph API.
app_Permissions_inventory_GraphSDK.ps1: Generates a permissions inventory using Graph SDK.
README.md: Documentation and details about the scripts.
3. Set Up Email Notifications for Application Credentials Expiry in Microsoft Entra
Location: entra/Set Up Email Notifications for Application Credentials Expiry in Microsoft Entra
Scripts:
AppCertsAndSecretsExpiryNotification.ps1: Sends email notifications for application credential expiry.
readme.md: Documentation and details about the script.
