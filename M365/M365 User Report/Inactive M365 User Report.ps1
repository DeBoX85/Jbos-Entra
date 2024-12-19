<#
The script will first gather all the users in your tenant with the Get-MgBetaUser cmdlet. It will then loop through each user to get their basic information, including the Sign-in Activity and Licensing assignments, then generate a new PowerShell object with this information and add it to the report. The report will then be exported as a CSV file to C:\temp\ where you can filter and sort the LastSignIn Activity columns to achieve your result.
#>

#Connect to Microsoft Graph
Connect-MgGraph -scope User.Read.All, AuditLog.read.All

#Gather all users in tenant
$AllUsers = Get-MgBetaUser -All -Property signinactivity

#Create a new empty array list object
$Report = [System.Collections.Generic.List[Object]]::new()

Foreach ($user in $AllUsers)
{
    #Null variables
    $SignInActivity = $null
    $Licenses = $null

    #Display progress output
    Write-host "Gathering sign-in information for $($user.DisplayName)" -ForegroundColor Cyan

    #Get current user information
    $licenses = (Get-MgBetaUserLicenseDetail -UserId $User.id).SkuPartNumber -join ", "

    #Create informational object to add to report
    $obj = [pscustomobject][ordered]@{
            DisplayName                = $user.DisplayName
            UserPrincipalName          = $user.UserPrincipalName
            Licenses                   = $licenses
            LastInteractiveSignIn      = $User.SignInActivity.LastSignInDateTime
            LastNonInteractiveSignin   = $User.SignInActivity.LastNonInteractiveSignInDateTime
            LastSuccessfullSignInDate  = $User.SignInActivity.LastSuccessfulSignInDateTime
        }
    
    #Add current user info to report
    $report.Add($obj)
}

$report | Export-CSV -path C:\temp\Microsoft365_User_Activity-Report.csv -NoTypeInformation
