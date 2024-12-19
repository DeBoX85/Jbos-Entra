OG TEXT: https://www.michev.info/blog/post/5922/reporting-on-entra-id-integrated-applications-service-principals-and-their-permissions 

YT with instructions https://www.youtube.com/watch?v=vO0m5yE3dZA

Updated version of a script for reporting on service principals, offering two versions based on different authentication methods.

The script requires specific permissions to collect service principal objects, properties, and permissions granted. It also provides options to include additional properties such as custom security attributes and sign-in statistics. The article outlines various parameters for running the script and provides examples of how to use it.

The output of the script includes a comprehensive report on service principals, their properties, and permissions granted. It also suggests key properties to focus on when reviewing the report and provides recommendations for periodic review and potential actions to take based on the findings.

Here’s the full set of parameters accepted by the script:

**IncludeBuiltin** – whether to include built-in/system service principals in the output. Default value is $false.

**IncludeOwnerOrg** – whether to “resolve” the appOwnerOrganizationId property to human-readable value, such as the tenant’s default domain. Using this switch requires the CrossTenantInformation.ReadBasic.All scope. 

**Default** value is $false.

**IncludeCSA** – short for “include Custom security attributes”, does what it says. Comes with the requirement for the CustomSecAttributeAssignment.Read.All scope. Default value is $false.

**IncludeSignInStats** – whether to include additional analytics about service principal usage and last sign-in timestamps. Requires both AuditLog.Read.All and Reports.Read.All scopes. Default value is $false.

**Verbose** – use this switch to show additional information about the script’s processing. Default value is $false.

Before moving into some examples on how to run the script and the output it provides, a few words on its inner workings. After authenticating, the first step is to retrieve the set of Service principal objects within the tenant. Here, depending on the set of parameters used, additional properties and/or objects will be collected. If the –IncludeSignInStats parameter is used, two additional queries are made, as follows:


`GET "https://graph.microsoft.com/beta/reports/servicePrincipalSignInActivities?$top=999"`
 
`GET "https://graph.microsoft.com/beta/reports/getAzureADApplicationSignInSummary(period='D30')"`

Without further ado, let’s look into some examples on how to run the script. First, get your copy from my GitHub repo for either the Graph API version or the Graph SDK one. For the former one, make sure to edit the authentication bits before running the script (lines 186-210). By default, the script will only cover the WindowsAzureActiveDirectoryIntegratedApp-tagged objects. Use the set of the parameters as needed. For the Graph SDK version, replace the script name with .\app_Permissions_inventory_GraphSDK.ps1 in the examples below.


#Run the script with the default parameter values
.\app_Permissions_inventory_GraphAPI.ps1
 
#To include "system" service principals, use the -IncludeBuiltin switch
.\app_Permissions_inventory_GraphAPI.ps1 -IncludeBuiltin
 
#To include custom security attributes, use the switch -IncludeCSA
.\app_Permissions_inventory_GraphAPI.ps1 -IncludeCSA
 
#To enrich the report with all possible properties, use
.\app_Permissions_inventory_GraphAPI.ps1 -IncludeCSA -IncludeOwnerOrg -IncludeSignInStats
 
#You can also use -Verbose to output additional processing info and -OutVariable to store the output in a variable for reuse
.\app_Permissions_inventory_GraphAPI.ps1 -Verbose -OutVariable out



Output will be exported to a CSV file in the working directory. Some properties might contain multiple values, i.e. the ones detailing the permissions granted to the SP. The format used is as follows: the “resource” name is presented in square brackets “[]”, followed by a comma-separated list of permissions granted. If the service principal has permissions granted for multiple resources, they are stringed together in semicolon-delimited list. For example:

<code> [Office 365 Management APIs]:ActivityReports.Read,ActivityReports.Read,ThreatIntelligence.Read,ActivityFeed.ReadDlp,ActivityFeed.Read,ServiceHealth.Read;[Microsoft Graph]:User.Read </code>


![image](https://github.com/DeBoX85/Azure-Personal/assets/134433647/90c8d922-dd90-4ad1-bfd4-9c848fae7c4e)



Instead of additional screens, here’s a list of new or important properties you should focus on when reviewing the report:

ApplicationId, aka the clientID of the parent application. When including built-in SPs, expect to see thing like the Microsoft Graph resource (00000003-0000-0000-c000-000000000000).

IsBuiltIn, i.e. is the SP object tagged with WindowsAzureActiveDirectoryIntegratedApp.

Owned by org has been updated to include the default domain of the owning organization, when you call the script with the –IncludeOwnerOrg parameter.

Publisher and Verified give you information about the publisher verification process. Unfortunately, Microsoft is still not exposing the Microsoft 365 app certification status for SP objects.

ObjectId is the GUID of the service principal.

Created On gives you its creation timestamp, i.e. when was it provisioned in your tenant.

Enabled gives you the status, if FALSE authentication via the SP is disabled.

Owners is a newly introduced property, giving you the UPN(s) of any owner(s) assigned to the SP.

Member of (groups) and Member of (roles) give you the list of groups and directory roles the given SP is a member of, respectively. You definitely want to review any SP with directory roles assigned, especially if 
it’s not a built-in one.

PasswordCreds, KeyCreds and TokenKey are also newly introduced, and you should examine any SP with non-null values here. Refer to this article for more information and remediation steps.

Permissions (application) gives you the list of Roles granted to the SP. Periodically review those!

Authorized By (application) signals whether admin consent has been granted to the Roles from the field above, whereas Last modified (application) gives us the date and time consent was granted.

Permissions (delegate) gives you the list of Scopes granted to the SP. Periodically review those, or at least the ones requiring admin consent.

Authorized By (delegate) gives you the list of users that have consented to at least one delegate permission, and also signals whether admin consent has been granted on the SP.

Valid until (delegate) is not used, but included for completeness.

Last sign-in is newly added field, exposed when invoking the -IncludeSignInStats switch. It gives you the timestamp when the SP was last used, i.e. the date and time of last authentication. It is the “most recent” out of the other four newly added timestamps: Last delegate client sign-in, Last delegate resource sign-in, Last app client sign-in and Last app resource sign-in.

Sign-in success count (30 days) and Sign-in failure count (30 days) are also newly introduced and only populated when using the -IncludeSignInStats switch. They give you the number of delegate login attempts for the past 30 days.

CustomSecurityAttributes is the last new field, giving you the list of CSAs. Only included when running the script with the –IncludeCSA switch.

