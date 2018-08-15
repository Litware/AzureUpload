<#
    .SYNOPSIS
        Import a users into Azure AD for B2C
#>

Connect-AzureAD

$userName = UserName
$email = "Email@Litware.com"
$password = "*****"

$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$passwordProfile.ForceChangePasswordNextLogin = $false
$PasswordProfile.Password = $password

$signInNames = @(
    (New-Object `
        Microsoft.Open.AzureAD.Model.SignInName `
        -Property @{Type = "emailAddress"; Value = $email})
)

New-AzureADUser -AccountEnabled $True -DisplayName $userName -PasswordProfile $passwordProfile -SignInNames $signInNames -CreationType "LocalAccount"
