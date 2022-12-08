function Write-log {

    

    [CmdletBinding(DefaultParameterSetName = 'ParameterSetMain', 
        SupportsShouldProcess = $true, 
        PositionalBinding = $false,
        HelpUri = 'http://www.microsoft.com/',
        ConfirmImpact = 'Medium')]
    [Alias()]
    [OutputType([String])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory = $false, 
            ParameterSetName = 'ParameterSetHeader')]
        [Switch] $Header,

        # Param2 help description
        [Parameter(ParameterSetName = 'ParameterSetMain')]
        [AllowNull()]
        [AllowEmptyCollection()]
        [ValidateSet('Information', 'Warning', 'Error')]
        $Category,

        [Parameter(ValueFromPipeline =$True,ParameterSetName = 'ParameterSetMain')]
        $Message,

        [Parameter(Mandatory = $false, ParameterSetName = 'ParameterSetMain')]
        [String] $Delimiter,

        # Param3 help description
        [Parameter(ParameterSetName = 'ParameterSetFooter')]
        [Switch]$Footer,

        [Parameter(Mandatory = $true)] [string] $Filepath,
        
        [Parameter(Mandatory = $false)]
        [Switch] $ToScreen


    )

    #Variables

    $ComputerName   = $env:COMPUTERNAME
    $CurrentUser    = $env:USERNAME
    $ScriptPath     = $myInvocation.ScriptName
    $OSVersion      = (Get-CimInstance -ClassName win32_operatingsystem).OSType
    $OsArchi        = (Get-CimInstance -ClassName win32_operatingsystem).OSArchitecture
    $DateNow        = Get-Date -Format "MM/dd/yyyy HH:mm"



    $logfile = $Filepath


    if ($header -eq $true) {

        $DateStart = Get-Date
        write-verbose "LogFile is $logfile"
        Set-Content -Path $LogFile -Value "+----------------------------------------------------------------------------------------+"
        Add-Content -Path $Logfile -Value "Script fullname`t`t:$ScriptPath"
        Add-Content -Path $Logfile -Value "When generated`t`t:$DateNow"
        Add-Content -Path $Logfile -Value "Current user`t`t:$CurrentUser"
        Add-Content -Path $Logfile -Value "Current computer `t:$ComputerName"
        Add-Content -Path $Logfile -Value "Operating System `t:$OSVersion"
        Add-Content -Path $Logfile -Value "Operating System `t:$OsArchi"
        Add-Content -Path $LogFile -Value "+----------------------------------------------------------------------------------------+"

    }


    if ($message -ne $false) {

    
        if ($Category -eq 'Information') { $CatMess = "INF"; $Color = "Cyan" }
        if ($Category -eq "Error") { $CatMess = "ERR"; $Color = "Red" }
        if ($Category -eq "Warning") { $CatMess = "WAR"; $Color = "Yellow" }
        $Delimiter = ";"  
        $DateMessage = get-date -format "yyyy-MM-dd HH:mm:ss"
        $FullMessage = $DateMessage + $Delimiter + $CatMess + $Delimiter + $Message

        add-content -Path $LogFile -Value $FullMessage

        if ($ToScreen -eq $true) {
            write-host $FullMessage -ForegroundColor $Color
        }



    }


    if ($footer -eq $true) {

        $DateStart  = (Get-Item $logfile).CreationTime
        $DateStop   = Get-Date
        $DiffDate   = new-timespan -Start $DateStart -End $DateStop
        $DateNow    = get-date -format "yyyy-MM-dd HH:mm:ss"

        Add-Content -Path $LogFile -Value "+----------------------------------------------------------------------------------------+"
        Add-Content -Path $Logfile -Value "End time`t`t:$DateNow"
        Add-Content -Path $Logfile -Value "Total duration (seconds)`t`t:$($DiffDate.TotalSeconds)"
        Add-Content -Path $Logfile -Value "Total duration (minutes)`t`t:$($DiffDate.TotalMinutes)"
        Add-Content -Path $LogFile -Value "+----------------------------------------------------------------------------------------+"

    }

}

function date_time() {
    return (Get-Date -UFormat "%Y-%m-%d_%I-%M-%S_%p").tostring()
}


class LogEntry {

    [string] $Timestamp
    [String] $Category
    [String] $Message
}



function ConvertFrom-Log {


    
    Param
    (
        # Param1 help description
        [Parameter(Mandatory = $true)]
        [string] $Filepath
    )

   

    if (test-path $Filepath) {
        
        $MyLogEntry = New-object -TypeName LogEntry
        # $Regex = '[0-9]{4}-[0-9]{2}-[0-9]{2}\s+[0-9]{2}:[0-9]{2}:[0-9]{2}(\.[0-9]{1,3})?;[a-zA-Z]'
        # $fileContent = Select-String -Path C:\scripts\log.txt -Pattern $Regex
        # $position = $fileContent.IndexOf(":")      
        # $FileContent = $fileContent.Substring($position+1)
        $fileContent = get-content -Path $Filepath

        $MyLog = $null
        $MyLog = @()
        $line = $null

        foreach ($line in $fileContent) {
            #Split fields into values
            $line = $fileContent -split (";")
            $MyLogEntry.Timestamp = $line[0]
            $MyLogEntry.Category = $line[1]
            $MyLogEntry.Message = $line[2]
            $Mylog += $MyLogEntry

        }
    }
    else {
        write-host "Log File does not exist" 
        exit
    }

    return $MyLog

}

