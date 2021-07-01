#!/bin/bash
#set -e
##################################################################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.online
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxb.com
# Website	:	https://www.arcolinuxiso.com
# Website	:	https://www.arcolinuxforum.com
# Website	:	https://www.alci.online
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
echo
echo "################################################################## "
tput setaf 2
echo "Phase 1 : "
echo "- Setting General parameters"
tput sgr0
echo "################################################################## "
echo

	#Let us set the desktop"
	#First letter of desktop is small letter

	#desktop="xfce"
	#lightdmDesktop="xfce"

	#arcolinuxVersion='v21.03.1'

	#isoLabel='arcolinux-next-'$arcolinuxVersion'-x86_64.iso'

	# setting of the general parameters
	archisoRequiredVersion="archiso 56-1"
	buildFolder=$HOME"/xerolinux-build"
	outFolder=$HOME"/xerolinux-Out"
	archisoVersion=$(sudo pacman -Q archiso)

	echo "################################################################## "
	#echo "Building the desktop                   : "$desktop
	#echo "Building version                       : "$arcolinuxVersion
	#echo "Iso label                              : "$isoLabel
	echo "Do you have the right archiso version? : "$archisoVersion
	echo "What is the required archiso version?  : "$archisoRequiredVersion
	echo "Build folder                           : "$buildFolder
	echo "Out folder                             : "$outFolder
	echo "################################################################## "

	if [ "$archisoVersion" == "$archisoRequiredVersion" ]; then
		tput setaf 2
		echo "##################################################################"
		echo "Archiso has the correct version. Continuing ..."
		echo "##################################################################"
		tput sgr0
	else
	tput setaf 1
	echo "###################################################################################################"
	echo "You need to install the correct version of Archiso"
	echo "Use 'sudo downgrade archiso' to do that"
	echo "or update your system"
	echo "If a new archiso package comes in and you want to test if you can still build"
	echo "the iso then change the version in line 37."
	echo "###################################################################################################"
	tput sgr0
	exit 1
	fi

echo
echo "################################################################## "
tput setaf 2
echo "Phase 2 :"
echo "- Checking if archiso is installed"
echo "- Saving current archiso version to archiso.md"
echo "- Making mkarchiso verbose"
tput sgr0
echo "################################################################## "
echo

	package="archiso"

	#----------------------------------------------------------------------------------

	#checking if application is already installed or else install with aur helpers
	if pacman -Qi $package &> /dev/null; then

			echo "Archiso is already installed"

	else

		#checking which helper is installed
		if pacman -Qi yay &> /dev/null; then

			echo "################################################################"
			echo "######### Installing with yay"
			echo "################################################################"
			yay -S --noconfirm $package

		elif pacman -Qi trizen &> /dev/null; then

			echo "################################################################"
			echo "######### Installing with trizen"
			echo "################################################################"
			trizen -S --noconfirm --needed --noedit $package

		fi

		# Just checking if installation was successful
		if pacman -Qi $package &> /dev/null; then

			echo "################################################################"
			echo "#########  "$package" has been installed"
			echo "################################################################"

		else

			echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			echo "!!!!!!!!!  "$package" has NOT been installed"
			echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			exit 1
		fi

	fi

	echo
	echo "Saving current archiso version to archiso.md"
	sudo sed -i "s/\(^archiso-version=\).*/\1$archisoVersion/" ../archiso.md
	echo
	echo "Making mkarchiso verbose"
	sudo sed -i 's/quiet="y"/quiet="n"/g' /usr/bin/mkarchiso

echo
echo "################################################################## "
tput setaf 2
echo "Phase 3 :"
echo "- Deleting the build folder if one exists"
echo "- Copying the Archiso folder to build folder"
tput sgr0
echo "################################################################## "
echo

	echo "Deleting the build folder if one exists - takes some time"
	[ -d $buildFolder ] && sudo rm -rf $buildFolder
	echo
	echo "Copying the Archiso folder to build work"
	echo
	mkdir $buildFolder
	cp -r ../archiso $buildFolder/archiso

echo
echo "################################################################## "
tput setaf 2
echo "Phase 4 : "
echo "- Adding time to /etc/dev-rel"
tput sgr0
echo "################################################################## "
echo
 	#Setting variables

 	oldname1='ArchLinux'
 	newname1='XeroLinux'

 	echo "Changing all references"
 	echo
 	sed -i 's/'$oldname1'/'$newname1'/g' $buildFolder/archiso/airootfs/etc/dev-rel

 	echo "Adding time to /etc/dev-rel"
 	date_build=$(date -d now)
 	echo "Iso build on : "$date_build
 	sudo sed -i "s/\(^ISO_BUILD=\).*/\1$date_build/" $buildFolder/archiso/airootfs/etc/dev-rel


echo
echo "################################################################## "
tput setaf 2
echo "Phase 5 :"
echo "- Cleaning the cache from /var/cache/pacman/pkg/"
tput sgr0
echo "################################################################## "
echo

	echo "Cleaning the cache from /var/cache/pacman/pkg/"
	yes | sudo pacman -Scc

echo
echo "################################################################## "
tput setaf 2
echo "Phase 6 :"
echo "- Building the iso - this can take a while - be patient"
tput sgr0
echo "################################################################## "
echo

	[ -d $outFolder ] || mkdir $outFolder
	cd $buildFolder/archiso/
	sudo mkarchiso -v -w $buildFolder -o $outFolder $buildFolder/archiso/



# echo
# echo "###################################################################"
# tput setaf 2
# echo "Phase 8 :"
# echo "- Creating checksums"
# echo "- Copying pgklist"
# tput sgr0
# echo "###################################################################"
# echo
#
# 	cd $outFolder
#
# 	echo "Creating checksums for : "$isoLabel
# 	echo "##################################################################"
# 	echo
# 	echo "Building sha1sum"
# 	echo "########################"
# 	sha1sum $isoLabel | tee $isoLabel.sha1
# 	echo "Building sha256sum"
# 	echo "########################"
# 	sha256sum $isoLabel | tee $isoLabel.sha256
# 	echo "Building md5sum"
# 	echo "########################"
# 	md5sum $isoLabel | tee $isoLabel.md5
# 	echo
 	echo "Moving pkglist.x86_64.txt"
 	echo "########################"
	rename=$(date +%Y-%m-%d)
 	cp $buildFolder/iso/arch/pkglist.x86_64.txt  $outFolder/xerolinux-$rename-pkglist.txt


echo
echo "##################################################################"
tput setaf 2
echo "Phase 8 :"
echo "- Making sure we start with a clean slate next time"
tput sgr0
echo "################################################################## "
echo

	#echo "Deleting the build folder if one exists - takes some time"
	#[ -d $buildFolder ] && sudo rm -rf $buildFolder

echo
echo "##################################################################"
tput setaf 2
echo "DONE"
echo "- Check your out folder :"$outFolder
tput sgr0
echo "################################################################## "
echo
