choix=$(whiptail --title "gg" --menu "Choose an option" 25 78 16 \
"1" "Archivage d’un répertoire" \
"2" "Compression d’une archive " \
"3" "Désarchivage d’une archive" \
"4" "Décompression d’une archive compressée" \
"5" "Comparaison de 2 fichiers" \
"6" "Mise en forme dun fichier .csv" \
"7" "Affiche votre configuration IP" \
"8" "Redémarre votre carte réseau" \
"9" "Quitter" 3>&2 2>&1 1>&3
)

exitstatut=$?


if [ $exitstatut = 0 ]; then
   
	case $choix in
		"1")   
		
		
					pathone=$(whiptail --inputbox "Entrez le Path exact du repertoire à archiver" 8 39  --title "" 3>&1 1>&2 2>&3)
                      	PathExist=$?
                      
			   if [ $PathExist = 0 ];
then
  
		tar -cvf $pathone.tar $pathone
		
fi	


			result="$pathone a été archivé"
		;;
		"2")   
			
			pathone=$(whiptail --inputbox "Entrez le nom de la fichier archivé" 8 39  --title "" 3>&1 1>&2 2>&3)
                      	PathExist=$?
                      
			   if [ $PathExist = 0 ];
then
  
		gzip $pathone 
		
fi	


			result="$pathone a été compréssé"
		;;
		
		"3")   
				pathone=$(whiptail --inputbox "le nom du fichier" 8 39  --title "" 3>&1 1>&2 2>&3)
                      	PathExist=$?
                      
			   if [ $PathExist = 0 ];
then
  
		tar -zxvf $pathone  
		
fi	

		
		
			result="Number of processes \nNumber os threads "
		;;
		
		
		
		"4")
		
		pathone=$(whiptail --inputbox "le nom du fichier" 8 39  --title "" 3>&1 1>&2 2>&3)
                      	PathExist=$?
                      
			   if [ $PathExist = 0 ];
then
  
		gzip -d $pathone  
		
fi	

		
		
			result="Number of processes \nNumber os threads "
		;;
		


		"5")   

		
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "ok installed")

    if [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get install vim;
 else  echo "Vim est deja installé"
fi	

					pathone=$(whiptail --inputbox "Entrez le Path exact de la premier fichier" 8 39  --title "" 3>&1 1>&2 2>&3)
                      	PathExist=$?
                      
			   if [ $PathExist = 0 ];
then
  pathTwo=$(whiptail --inputbox "Entrez le Path exact de la deuxieme fichier" 8 39 Blue --title "" 3>&1 1>&2 2>&3)
                      	PathExistA=$?
                      
			   if [ $PathExistA = 0 ]; then
			   vimdiff $pathone $pathTwo 
			   
 else  exit
fi	
fi
		;;

		"7")   
			ip=$(ip addr show)
		      result="$ip"
		;;

		"8")   
			 sudo  systemctl restart NetworkManager.service
			 result="la carte réseau a été redémarrée !"
		;;

		"9") exit
		;;
	esac
	whiptail --msgbox "$result" 20 78
else
    echo "User selected Cancel." $exitstatut
fi




