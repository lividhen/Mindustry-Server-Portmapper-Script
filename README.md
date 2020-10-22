# Mindustry-Server-Portmapper-Script


A set of scripts to use UPnP Portmapper (by kaklakariada) To open port 6567 for udp and tcp.
As the mindustry wiki says, "It is recommended and that you use a domain name or DNS service to mask your IP for public servers for ease of use, or even better, use a cloud service e.g. Amazon AWS or a dedicated server/VM from a hosting provider such as Linode or DigitalOcean, which is much safer. Do your research, and determine which option best fits your needs.", This may suit you if you just want to play with some friends remotly for a little while. I would reccomend atleast using DuckDns or noIP to mask your public IP.

These scripts contain the commands you would use to open the ports with portminer yourself, I have just compiled them into one script for convenience.

## Usage
These scripts are intended to be used to open port 6567 for a portminer server.
Please configure your server **prior** to using these scripts to open the port, as this can be dangerous when the server is not bound to it.
Feel free to edit these scripts if you need a different mindustry server jar name, need to give portminer your IP, or need to add launch options to the mindustry server.

## Requirements
Java 8+.

UPnP enabled on your router.

An internet connection, with access to github.

Curl (I think windows and most linux distros have it by default)

## Dangers
These scripts use Portmapper to open port 6567 on your router making it avalable to **EVERYONE** on the internet. If the Mindustry server is not running, then anyone can access your network through that port with no restrictions.
**NEVER!** I repeate, **NEVER** hit X on the command prompt when the server is running and or the ports are open. It will leave port 6567 open and leave your network vulnrable. Always use the command "exit" (without quotes) to close the server and the command window, as it will be able to close the port.
	
###### Linux script still a WIP.
