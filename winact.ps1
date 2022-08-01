$script:banner = "
oooooo   oooooo     oooo  o8o                                      .
 ``888.    ``888.     .8`'   ```"`'                                    .o8
  ``888.   .8888.   .8`'   oooo  ooo. .oo.    .oooo.    .ooooo.  .o888oo
   ``888  .8`'``888. .8`'    ``888  ``888P`"Y88b  ``P  )88b  d88`' ```"Y8   888
    ``888.8`'  ``888.8`'      888   888   888   .oP`"888  888         888
     ``888`'    ``888`'       888   888   888  d8(  888  888   .o8   888 .
      ``8`'      ``8`'       o888o o888o o888o ``Y888`"`"8o ``Y8bod8P`'   `"888`"

                                     *** Windows Activator, version: 0.3
                                     By: Sr. Meia-noite#0224
"

function main 
{
    clear

    Write-Host "`n *** Welcome to..."
    Write-Host "$script:banner"

    $id        = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object System.Security.Principal.WindowsPrincipal($id)

    if (-not($principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)))
    {
        Write-Host " *** Fatal: Error: Not in Administrator mode. Please run this script as an Administrator."
        return
    }

    Write-Host " *** Supported versions may include:"
    Write-Host "     - Win10"
    Write-Host "     - Win11"
    Write-Host "`n *** Hint: It looks like your Windows version is $([Environment]::OSVersion.Version.Major)."
    $OSVersion = Read-Host "`n *** Please select your version (10, 11)"
    $loaded    = $false;

    if ($OSVersion -eq "10")
    {
        Write-Host "`n *** Loading Windows 10 configurations..."

        $loaded = $true;

        $script:server = "kms.lotro.cc"

        $script:licenses = @{
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

        $script:licenses_keys = @{
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
    }

    if ($OSVersion -eq "11")
    {
        Write-Host "`n *** Loading Windows 11 configurations..."

        $loaded = $true;

        $script:server = "s8.now.im"

        $script:licenses = @{
            a = "Windows 11 Pro"                      
            b = "Windows 11 Pro N"                    
            c = "Windows 11 Pro Workstations"         
            d = "Windows 11 Pro Workstations N"       
            e = "Windows 11 Pro Education"            
            f = "Windows 11 Home"                     
            g = "Windows 11 Home N"                   
            h = "Windows 11 Home Home Single Language"
            i = "Windows 11 Home Country Specific"    
            j = "Windows 11 Education"                
            k = "Windows 11 Education N"              
            l = "Windows 11 Enterprise"               
            m = "Windows 11 Enterprise N"             
            n = "Windows 11 Enterprise G"             
            o = "Windows 11 Enterprise G N"           
            p = "Windows 11 Enterprise LTSC 2019"     
            q = "Windows 11 Enterprise N LTSC 2019"   
        }

        $script:licenses_keys = @{
            "Windows 11 Pro"                       = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
            "Windows 11 Pro N"                     = "MH37W-N47XK-V7XM9-C7227-GCQG9"
            "Windows 11 Pro Workstations"          = "NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J"
            "Windows 11 Pro Workstations N"        = "9FNHH-K3HBT-3W4TD-6383H-6XYWF"
            "Windows 11 Pro Education"             = "6TP4R-GNPTD-KYYHQ-7B7DP-J447Y"
            "Windows 11 Home"                      = "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
            "Windows 11 Home N"                    = "3KHY7-WNT83-DGQKR-F7HPR-844BM"
            "Windows 11 Home Home Single Language" = "7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH"
            "Windows 11 Home Country Specific"     = "PVMJN-6DFY6-9CCP6-7BKTT-D3WVR"
            "Windows 11 Education"                 = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
            "Windows 11 Education N"               = "2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
            "Windows 11 Enterprise"                = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
            "Windows 11 Enterprise N"              = "DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"
            "Windows 11 Enterprise G"              = "YYVX9-NTFWV-6MDM3-9PT4T-4M68B"
            "Windows 11 Enterprise G N"            = "44RPN-FTY23-9VTTB-MP9BX-T84FV"
            "Windows 11 Enterprise LTSC 2019"      = "M7XTQ-FN8P6-TTKYV-9D4CC-J462D"
            "Windows 11 Enterprise N LTSC 2019"    = "92NFX-8DJQP-P6BBQ-THF9C-7CG2H"
        }
    }

    if (-not($loaded))
    {
        Write-Host "`n *** Fatal: Error: Version $OSVersion does not exist."
        return
    }

    Write-Host "`n *** Available Windows $OSVersion versions: "

    foreach ($pair in $script:licenses.GetEnumerator() | Sort-Object Name)
    {
        Write-Host "     - $($pair.Name): $($pair.Value)"
    }

    Write-Host "`n *** Hint: It looks like you Windows version is `"$((Get-ComputerInfo).WindowsProductName)`"."

    $version_letter = Read-Host "`n *** Select your Windows version (a, b, c...)"

    try
    {
        $version_name   = $script:licenses.$version_letter
        $version_serial = $script:licenses_keys.$version_name
    }
    catch [System.Management.Automation.RuntimeException] 
    {
        Write-Host "`n *** Fatal: Error: The selected version does not exist, please try again."
        return
    }

    Write-Host "`n *** Initializing the activating protocol..."

    try
    {
        $root    = "$env:windir\System32"
        $cscript = "$root\cscript.exe"
        $slmgr   = "$root\slmgr.vbs"

        $command = "$cscript $slmgr"

        Write-Host "`n *** Changing the windows key to <$version_serial>..."
        Invoke-Expression "$command /ipk $version_serial"

        Write-Host "`n *** Changing the microsoft server to <$script:server>..."
        Invoke-Expression "$command /skms $script:server"

        Write-Host "`n *** Activating your windows..."
        Invoke-Expression "$command /ato"
    }
    catch
    {
        Write-Host "`n *** Fatal: Error: Something went wrong in the activation, please try again."
        return
    }

    Write-Host "`n *** All done! Hopefully your windows is now activated!"

} main

Write-Host "`n *** Finalizing..."
