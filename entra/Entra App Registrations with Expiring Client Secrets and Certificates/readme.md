# Managing Expiring Client Secrets and Certificates in Microsoft 365

OG text found : https://blog.admindroid.com/retrieve-entra-app-registrations-with-expiring-client-secrets-and-certificates/

In Microsoft 365 organizations, various applications, including third-party apps, are integrated and used for completing various tasks and projects. Developers can also register their applications in Entra ID for organizational use. These applications use app client secrets and certificates to authenticate their identity when requesting a token. However, client secrets and certificates for all registered applications will expire after a certain period. Thus, it is essential for admins to identify applications with expiring client secrets & certificates and take actions accordingly for efficient and seamless usage of applications in M365.

Let’s explore how to get all Azure applications with expiring client secrets and certificates in Microsoft 365.

## How to Get All Entra ID Applications with Expiring Client Secrets & Certificates?

To find out the expiry details of client secrets and certificates for an application, admins can use either the Microsoft Entra Admin Center or Microsoft Graph PowerShell.

- **Find expiration date of app client secrets and certificates using Entra admin center**
- **Export app registrations with expiring client secrets and certificates using PowerShell**

> **Note:** Admins can also implement secure score recommendations to secure third-party apps.

## Find Expiration Date of App Client Secrets and Certificates Using Entra Admin Center

1. Navigate to the Microsoft Entra Admin Center.
2. Go to **Applications** -> **App registrations** -> **All applications** tab.
3. Select a specific application for which you want to find out the expiry details.
4. Select **Certificates & Secrets**.
5. In the **Client secrets** tab, you will find the expiry date of the app’s client secret.
6. Click on the **Certificates** tab to find the expiry date of the app certificate.

> **Note:** To avoid app security risks, admins can manage user consents and remove unused credentials.

## Export App Registrations with Expiring Client Secrets and Certificates Using PowerShell

In the Entra admin center, obtaining expiry details for client secrets and certificates might be challenging as you must navigate to each application individually. To efficiently identify the expiration details, you can use the Microsoft Graph PowerShell method. For this, we have developed a script to solve different use cases and minimize your hurdles!

### 1. Get All Azure AD Apps with Expiring Client Secrets and Certificates

Verifying the expiry date of client secrets and certificates for all applications helps to take necessary actions for seamless app usage. Running this script will export all applications in Entra ID with expiry details of their client secrets and certificates.

```powershell
.\AppRegistrationsWithExpiringCertAndSecrets.ps1
```

This report will contain a list of all apps with expiring certificates and client secrets along with app name, owner, creation time, etc.

### 2. Retrieve All Entra ID Apps with Expiring Client Secrets

For app registrations that contain only client secrets, you can retrieve apps with client secret expiration details alone by running the script with the `-ClientSecretsOnly` parameter as below.

```powershell
.\AppRegistrationsWithExpiringCertAndSecrets.ps1 -ClientSecretsOnly
```

The above cmdlet exports the apps with their client secret expiry details in your Entra ID environment.

### 3. Find a List of All Azure AD Apps with Expiring Certificates

If you want to find out only the expiration details of the app certificates, you can run the script with the `-CertificatesOnly` parameter.

```powershell
.\AppRegistrationsWithExpiringCertAndSecrets.ps1 -CertificatesOnly
```

This shows the list of Entra ID apps with their certificate expiration details.

### 4. Retrieve a List of All Azure AD Apps with Certificates and Secrets Expiring in 30 Days

To get a more granular report like apps with certificates and secrets expiring in n days (i.e., 30, 90, etc.), you can run the script as below.

```powershell
.\AppRegistrationsWithExpiringCertAndSecrets.ps1 -SoonToExpireInDays “30”
```

The above cmdlet retrieves a list of all applications with certificates and secrets expiring in 30 days.

You can also use the `SoonToExpireInDays` parameter with `-ClientSecretsOnly` or `-CertificatesOnly` parameter to get detailed reports, like apps with client secrets expiring in n days or apps with certificates expiring in n days.

---

I hope this guide assists you in retrieving Entra ID applications with their certificates and secrets expiry details efficiently. Utilize this script to avoid downtime and secure your M365 applications. For more queries, feel free to reach us through the comment section. Happy scripting!  
