
[CmdletBinding()]
Param()

<#
    Update the index.json file created by the DocFX build to parse keywords based on characters other
    than whitespace.  Currently, only forward slash is added.
#>

function GetDocumentNames
{
    param([object] $Index)
    return ($Index | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name)
}

function IsValidIndex
{
    param(
        [object] $OriginalIndex,
        [object] $NewIndex
    )
    # Cursory check to make sure we have a coherent index. More logic can be added here if we have problems.
    $originalDocuments = (GetDocumentNames -Index $OriginalIndex)
    $newDocuments = (GetDocumentNames -Index $NewIndex)
    $differences = @(Compare-Object -ReferenceObject $originalDocuments -DifferenceObject $newDocuments -SyncWindow 0)
    
    return ($differences.Length -eq 0)
}

function UpdateIndex
{
    param(
        [object] $Index,
        [string] $ParsingCharRegex = "\/",
        [char] $ParsingChar = '/',
        [string] $KeywordDelimiter = " "
    )

    $documentNames = GetDocumentNames -Index $Index
    foreach($documentName in $documentNames)
    {
        $tempKeywords = $Index.$documentName.keywords
        $tempKeywordsArray = $tempKeywords.Split($KeywordDelimiter);
        [string[]] $newKeywordsArray = @()
        foreach($tempKeyword in $tempKeywordsArray) {
            $newKeywordsArray += $tempKeyword
            if($tempKeyword.IndexOf($ParsingChar) -ne -1) {
                $subKeywords = [regex]::Replace($tempKeyword, $ParsingCharRegex, $KeywordDelimiter)
                $newKeywordsArray += $subKeywords.Split($ParsingChar)
            }
        }
        $Index.$documentName.keywords = $newKeywordsArray -join $KeywordDelimiter
    }

    return $Index
}

$ErrorActionPreference = "Stop"
[string] $SourcesDirectory = (get-item $PSScriptRoot).parent.FullName
Write-Host "SourcesDirectory is $SourcesDirectory"
[string] $indexFileName = "index.json"
[string] $deploymentFolderName = "_site"
$indexFilePath = Join-Path -Path (Join-Path -Path "$SourcesDirectory" -ChildPath $deploymentFolderName) -ChildPath $indexFileName

if(-not(Test-Path -LiteralPath $indexFilePath)) {
    throw [System.Exception] "Index file not found at $indexFilePath"
}
$originalIndex = Get-Content $indexFilePath | ConvertFrom-Json

if($null -eq $originalIndex) {
    throw [System.Exception] "Index file is empty or could not be read."
}
$newIndex = UpdateIndex -Index $originalIndex

if(-not(IsValidIndex -OriginalIndex $originalIndex -NewIndex $newIndex)) {
    throw [System.Exception] "Invalid index detected after update."    
}
ConvertTo-Json $newIndex | Out-File -FilePath $indexFilePath -Force -Encoding ascii

exit 0
