Get-Service 
$service = Read-Host "r`n nom de service ?  "
$choix = Read-Host "`r`n Mettez le numéro de votre choix `r`n (1) pour démarrerle service $service `r`n (2) pour arreter le service $service `r`n"

switch($choix)
{
    '1' { net start $service  } 
    '2' {  net stop $service }
}