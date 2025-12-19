
function Get-History-Full { 
    $find = $args; 
    Write-Host "Finding in full history using {`$_ -like `"*$find*`"}"; 
    Get-Content (Get-PSReadlineOption).HistorySavePath | ? {$_ -like "*$find*"} | Get-Unique | more 
}

function Test-UDPPort {
    param (
        [string]$ComputerName,
        [int]$Port,
        [int]$Timeout = 3000
    )

    try {
        $udpClient = New-Object System.Net.Sockets.UdpClient;
        $udpClient.Connect($ComputerName, $Port);

        $message = [System.Text.Encoding]::ASCII.GetBytes("Hello");
        $udpClient.Send($message, $message.Length);

        $udpClient.Client.ReceiveTimeout = $Timeout;
        $remoteEndPoint = New-Object System.Net.IPEndPoint([System.Net.IPAddress]::Any, 0);

        $response = $udpClient.Receive([ref]$remoteEndPoint);
        Write-Host "UDP port $Port on $ComputerName is open and responded.";
    }
    catch {
        Write-Host "No response from UDP port $Port on $ComputerName (might be closed or filtered).";
    }
    finally {
        $udpClient.Close()
    }
}

function Get-VMS-IPs {
get-vm | ?{$_.State -eq "Running"} | select -ExpandProperty networkadapters | select vmname, macaddress, switchname, ipaddresses | ft -wrap -autosize
}

function Get-Container-IPs {
docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
}

function Get-Hostname {
    param (
        [string]$ipAddress
    )
    ([System.Net.Dns]::GetHostByAddress($ipAddress)).Hostname
}