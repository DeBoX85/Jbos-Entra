
To simplify the work of offboarding an M365 user, we have developed a PowerShell script that makes offboarding quick and secure. With the script, you can automate 14 user offboarding best practices.

Below are the things you can do with the script:

Disable the user account: Block the offboarded employee from accessing their Microsoft 365 user account.
Reset password: Reset the password of the user to a random value.
Reset office name: Reset the office location of the offboarded user.
Remove mobile number: Remove the personal mobile number associated with the user account.
Remove group memberships: Strip the offboarded employee of all Microsoft 365 group memberships.
Remove application role assignments: Remove all application specific roles assigned to a user.
Remove admin roles: Remove all the administrative roles assigned to the user account.
Hide from address lists: Hide the user account from all address lists in your Microsoft 365 environment.
Remove email aliases: Remove all the email aliases associated with the user account in your environment.
Wipe mobile device: Remotely wipe mobile devices associated with the account.
Delete inbox rule: Remove all existing inbox rules set by the user.
Convert to shared mailbox: Change the email inbox of the user to a shared one.
Remove License: Revoke the Microsoft 365 license assigned to the offboarded employee.
Sign out from all user sessions: Easily sign out the user from all his user sessions with one click.
All operations: Perform all the above listed operations in one go as well.

Automate Employee Offboarding in Microsoft 365 – Script Execution
The script can be executed in PowerShell with the following command:

PowerShell:

./M365UserOffBoarding.ps1

The script then prompts for the UPN (User Principal name) of the user to be off-boarded. You can also specify multiple user accounts here. Make sure to separate each UPN by a comma.

Example: avidem@contoso.onmicrosoft.com, elara@contoso.onmicrosoft.com

You are then prompted for the action that you need to perform. Choose Option 15 to perform all the operations in one go.

You can also choose to carry out specific operations or their combinations by passing the respective numbers.

Sample Output Report
Based on the action performed and its successful completion, the following output files are generated:

Microsoft 365 Offboarding Status Report: ‘M365UserOffBoarding_StatusFile.csv’ contains details on the status of each operation.

Password Reset Log File: ‘PasswordLogFile.txt’ contains the list of random passwords set for each user. This file is generated when the ‘Password Reset to Random’ operation is performed.
Invalid Users Log File: ‘InvalidUsersLogFile.txt’ contains the list of invalid UPN’s entered.
