@echo off
echo Automated script to use Portmaper (by kaklakariada) to attempt to open port 6567 for both tcp and udp on your router; Download portmaper; and Download the Mindustry server jar, both from GitHub. Script by lividhen. For this to work you need Java on your pc and upnp enabled on your router.  If you do not use this script following the instructions, damage, loss, privacy breaches, or network breaches, etc, may occur.
echo Portminer github: https://github.com/kaklakariada/portmapper
echo Mindustry github: https://github.com/Anuken/Mindustry
timeout 10
cls
IF EXIST portmapper.jar (
    goto next
) ELSE (
    echo Downloading portmapper-2.2.1.jar from github!
    curl -L https://github.com/kaklakariada/portmapper/releases/download/v2.2.1/portmapper-2.2.1.jar --output portmapper.jar
)
:next
IF EXIST [Server]Mindustry.jar (
  echo Server jar found.
  goto start
) ELSE (
  echo Please download the latest server jar from either github or itch.io, and rename it to [Server]Mindustry.jar and put it in this directory.
  echo https://github.com/Anuken/Mindustry/releases/latest
  echo https://anuke.itch.io/mindustry
  pause
  goto end
)
:start
cls
echo When using this script ALWAYS close the server by typing exit. NEVER hit the X button on the command prompt! It will leave your network vulnerable!!!
echo Remember to have Java installed! UPnP also needs to be enabled on your router!
echo If the port does not open you may need to manually add your computer's ip address on lines 31 and 32 of the batch file. Looking at the portmaper documentation or the git wiki can help. 
timeout 5
echo Attempting to open port 6567 on router.
start java -jar portmapper.jar -add -externalPort 6567 -internalPort 6567 -description MindustryMultiplayer -protocol tcp
start java -jar portmapper.jar -add -externalPort 6567 -internalPort 6567 -description MindustryMultiplayer -protocol udp
echo If the ports were successfully opened, your network is open to anyone through port 6567 via both tcp and udp protocols. When mindustry server launches (which it is set to do by default), it will handle all traffic over that port, only letting Mindustry clients connect. Put your configuration options AFTER the word host. Also never remove the word host, as it will stop the server from opening, potentally making the port open before the server binds it, which will leave your network open to attack. 
echo The mindustry server launch options can be edited on line 35.
java -jar [Server]Mindustry.jar host
java -jar portmaper.jar -delete -externalPort 6567 -protocol tcp
java -jar portmaper.jar -delete -externalPort 6567 -protocol udp
echo Attempted to automatically close ports. You may want to double check by opening the portmaper.jar and clicking connect. If there are any entries with port 6567 click them and hit remove.
:end
timeout 10
exit