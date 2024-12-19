# Create an Inactive M365 User Report with Microsoft Graph PowerShell

*OG article : https://ourcloudnetwork.com/create-an-inactive-m365-user-report-with-microsoft-graph-powershell/*

With many users in your Microsoft 365 tenant, it is difficult to simply glance at your user list to determine if it is accurate or not. As well as this, you need to ensure you are not being overbilled and that you are not susceptible to additional risk of compromise by having dormant and available accounts still in your tenant. 

To generate the Inactive Microsoft 365 user report in this tutorial you must ensure you have the Microsoft Graph PowerShell Beta modules installed. 
Check out my tutorial here: How To Install the Microsoft Graph PowerShell Module which details how to install and upgrade the Microsoft Graph PowerShell modules: https://ourcloudnetwork.com/how-to-install-the-microsoft-graph-powershell-sdk/

As well as this, to grant consent to Microsoft Graph API permissions in Microsoft Entra you will need to sign in interactively at the start of the script with a global admin account. Once that is done, you can then lower the permissions on the account used to sign-in.

The permissions you will grant to the Microsoft Graph Command Line Tools application are:

User.Read.All
AuditLog.Read.All

## Inactive M365 User Report Script
The script will first gather all the users in your tenant with the Get-MgBetaUser cmdlet. It will then loop through each user to get their basic information, including the Sign-in Activity and Licensing assignments, then generate a new PowerShell object with this information and add it to the report. The report will then be exported as a CSV file to C:\temp\ where you can filter and sort the LastSignIn Activity columns to achieve your result.
