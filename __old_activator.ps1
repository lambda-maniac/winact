# 
# OLD VERSION, SEE `winact.ps1'
# 

$global:licenses = @{
    a = "Home/Core" 
    b = "Home/Core (Country Specific)"
    c = "Home/Core (Single Language)"
    d = "Home/Core N"
    e = "Professional (Wind 10 pro)"
    f = "Professional N (Wind 10 pro N)"
    g = "Enterprise"
    h = "Enterprise N"
    i = "Education"
    j = "Education N"
    k = "Enterprise 2015 LTSB"
    l = "Enterprise 2015 LTSB N"
    m = "Enterprise 2016 LTSB"
    n = "Enterprise 2016 LTSB N"
}

$global:licenses_keys = @{
    "Home/Core"                      = "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
    "Home/Core (Country Specific)"   = "PVMJN-6DFY6-9CCP6-7BKTT-D3WVR"
    "Home/Core (Single Language)"    = "7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH"
    "Home/Core N"                    = "3KHY7-WNT83-DGQKR-F7HPR-844BM"
    "Professional (Wind 10 pro)"     = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
    "Professional N (Wind 10 pro N)" = "MH37W-N47XK-V7XM9-C7227-GCQG9"
    "Enterprise"                     = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
    "Enterprise N"                   = "DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"
    "Education"                      = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
    "Education N"                    = "2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
    "Enterprise 2015 LTSB"           = "WNMTR-4C88C-JK8YV-HQ7T2-76DF9"
    "Enterprise 2015 LTSB N"         = "2F77B-TNFGY-69QQF-B8YKP-D69TJ"
    "Enterprise 2016 LTSB"           = "DCPHK-NFMTC-H88MJ-PFHPY-QJ4BJ"
    "Enterprise 2016 LTSB N"         = "QFFDN-GRT3P-VKWWX-X7T3R-8B639"
}

function main
{
    Write-Host "--------------------------"
    Write-Host "- Windows Activator v0.2 -"
    Write-Host "--------------------------"

    $id        = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object System.Security.Principal.WindowsPrincipal($id)

    if (-not($principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)))
    {
        Write-Host ":: Error: Not in Administrator mode. Please run this script as an Administrator."
        return
    }

    Write-Host ":: Select your windows version: "

    foreach ($pair in $global:licenses.GetEnumerator() | Sort-Object Name)
    {
        Write-Host "  [$($pair.Name)] $($pair.Value)"
    }

    Write-Host "--------------------------------------"
    Write-Host "Hint: It looks like your version is :: '$((Get-WmiObject Win32_OperatingSystem).Caption)'."
    Write-Host "--------------------------------------"

    $version_letter = Read-Host ":: Enter your version"

    try
    {
        $version_name   = $global:licenses.$version_letter
        $version_serial = $global:licenses_keys.$version_name
    }
    catch [System.Management.Automation.RuntimeException] 
    {
        Write-Host ":: Error: The selected version does not exist, please try again."
        return
    }

    Write-Host ":: Activating..."

    try
    {
        $root    = "C:\Windows\System32"
        $cscript = "$root\cscript.exe"
        $slmgr   = "$root\slmgr.vbs"

        $command = "$cscript $slmgr"

        Write-Host ":: Changing the windows key to <$version_serial>..."
        Invoke-Expression "$command /ipk $version_serial"

        Write-Host ":: Changing the microsoft server to <kms.lotro.cc>..."
        Invoke-Expression "$command /skms kms.lotro.cc"

        Write-Host ":: Activating windows..."
        Invoke-Expression "$command /ato"
    }
    catch
    {
        Write-Host ":: Error: Something went wrong in the activation, please try again."
        return
    }

    Write-Host ":: All done!"

} main
