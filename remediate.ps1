$Username = "Admin01"
$Password = "P@ssw0rd123!"  # Replace with a secure password or rotate after creation

if (-not (Get-LocalUser -Name $Username -ErrorAction SilentlyContinue)) {
    New-LocalUser -Name $Username -Password (ConvertTo-SecureString $Password -AsPlainText -Force) -FullName "Intune Managed Admin" -Description "Local admin account for LAPS"
    Add-LocalGroupMember -Group "Administrators" -Member $Username
} elseif (-not (Get-LocalGroupMember -Group "Administrators" | Where-Object { $_.Name -eq $Username })) {
    Add-LocalGroupMember -Group "Administrators" -Member $Username
}
