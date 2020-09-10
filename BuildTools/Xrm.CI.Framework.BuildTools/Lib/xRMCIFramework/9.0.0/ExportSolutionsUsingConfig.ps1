#
# ExportSolutionsUsingConfig.ps1
#

param(
[string]$ConnectionString,
[string]$OutputFolder,
[string]$ConfigFilePath,
[int]$Timeout
)

$ErrorActionPreference = "Stop"
$InformationPreference = "Continue"

Write-Verbose 'Entering ExportSolutionsUsingConfig.ps1'

#Parameters
Write-Verbose "ConnectionString = $ConnectionString"
Write-Verbose "OutputFolder = $OutputFolder"
Write-Verbose "ConfigFilePath = $ConfigFilePath"
Write-Verbose "Timeout = $Timeout"

#Script Location
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Write-Verbose "Script Path: $scriptPath"

#Load XrmCIFramework
$xrmCIToolkit = $scriptPath + "\Xrm.Framework.CI.PowerShell.Cmdlets.dll"
Write-Verbose "Importing CIToolkit: $xrmCIToolkit" 
Import-Module $xrmCIToolkit
Write-Verbose "Imported CIToolkit"
$ConfigFilePath = "https://github.com/ravikatrenikona/dyn365-ce-vsts-tasks/blob/master/BuildTools/Xrm.CI.Framework.BuildTools/Lib/xRMCIFramework/9.0.0/task.json"
#Solution Export

Write-Host "Exporting Solutions"
        
$exportedFiles = Export-XrmSolutions -ConnectionString "$ConnectionString" -ConfigFilePath "$ConfigFilePath" -OutputFolder "$OutputFolder" -Timeout $Timeout
    
Write-Host "Managed Solution Exported $exportedFiles"

Write-Verbose 'Leaving ExportSolutionsUsingConfig.ps1'
