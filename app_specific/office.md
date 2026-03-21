# Office Trix

## Uninstall of a specific version (using powershell)

Lets assume we want to uninstall everything related to office 2016 (16.x)

first we need to find what is installed related to office

Prompt:

```powershell
Get-AppxPackage -Name "*office*" | Select-Object Name, Version | Format-Table
```

Feedback:

```powershell
Name                                    Version
----                                    -------
Microsoft.Office.OneNoteVirtualPrinter  1.0.0.0
Microsoft.MicrosoftOfficeHub            19.2603.38021.0
Microsoft.OfficePushNotificationUtility 16.0.19916.20000
Microsoft.Office.ActionsServer          16.0.19916.20000
```

ok now lets filter everything related to office 16

Prompt:

```powershell
Get-AppxPackage -Name "*office*" |
    Where-Object { $_.Version.Major -eq 16 } |
    Select-Object Name, Version |
    Format-Table
```

Feedback

```powershell
Name                                    Version
----                                    -------
Microsoft.OfficePushNotificationUtility 16.0.19916.20000
Microsoft.Office.ActionsServer          16.0.19916.20000
```

ok, lets uninstall it

Now lets uninstall

```powershell
Get-AppxPackage -Name "*office*" |
    Where-Object { $_.Version.Major -eq 16 } |
    Remove-AppxPackage
```
