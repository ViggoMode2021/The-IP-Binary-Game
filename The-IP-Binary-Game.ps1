$Date = Get-Date -Format "MM-dd-yyyy"

Write-Host "Welcome to Nerdle. You will receive a few networking questions for today, $Date." -ForegroundColor DarkGray

$IP = Get-NetIpAddress | Where { $_.InterfaceAlias -EQ "Wi-Fi" -and $_.AddressFamily -EQ "IPv4" } | Select -expand IPAddress

$IP_in_Binary = -join ($IP.split(".") | foreach-object {[system.convert]::tostring($_, 2).padleft(8, "0")})

$IP_in_Binary = [string]$IP_in_Binary

write-host $IP_in_Binary

$Binary_Length = $IP_in_Binary.length

#Write-Host "Your answer needs to be $Binary_Length digits long." -ForeGroundColor "Cyan"

Write-Host "Your ip address is $IP. Please calculate it in binary." -ForeGroundColor "Green"

Write-Host "Here is the binary conversion chart: `n128, 64, 32, 16, 8, 4, 2, 1" -ForegroundColor "Yellow"

# FIRST OCTET PROBLEM #

$First_Octet = $IP.Substring(0,3)

Write-Host "Write the first octet ($First_Octet) in binary." -ForeGroundColor "Cyan"

$Answer_First_Octet = Read-Host "Please type your answer"

$IP_in_Binary_First_Octet = $IP_in_Binary.substring(0,7)

if($Answer_First_Octet -eq $IP_in_Binary_First_Octet){

Write-Host "Correct!!!" -ForegroundColor "Green"

}

else{
                                                                #172.17.2.16
Write-Host "Incorrect, the answer is $IP_in_Binary_First_Octet" #10101100010001000000100010000
                                                                #10101100
                                                                        #010001

}

# SECOND OCTET PROBLEM #

$Second_Octet = $IP.Substring(4,2)

Write-Host "Write the second octet ($Second_Octet) in binary." -ForeGroundColor "Cyan"

$Answer_Second_Octet = Read-Host "Please type your answer"

$IP_in_Binary_Second_Octet = $IP_in_Binary.substring(8,15)

if($Answer_Second_Octet -eq $IP_in_Binary_Second_Octet){

Write-Host "Correct!!!" -ForegroundColor "Green"

}

else{

Write-Host "Incorrect, the answer is $IP_in_Binary_Second_Octet" #10101100010001000000100010000

}
