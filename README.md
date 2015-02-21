# runuo_rpi
RunUO distribution for Raspberry Pi

This distribution of RunUO is based on the latest version stored here
on GitHub.  The difference being is that after spending some time
massaging the distibution, I've got it to compile cleanly on the
ARM based Raspberry Pi 2.  Note, I'm using the newest version of the
Raspberry Pi because it has more processing and memory.  Before you 
even get started, you need to catch up to my basic setup:


=====================================================================
ITEMS NEED:

(1) Rasperry Pi 2 (~35 USD)
(1) 32GB Micro SD (~15 USD)


=====================================================================
OPTIONAL ITEMS:

I plug my Pi's onto the network with Ethernet.  It is simpler to 
configure, saves a USB port and saves on Power.  If you want to,
you can purchase a Mini WiFi adapter.  I recommend the:

Edimax EW-7811Un Wi-Fi USB Adapter (~9 USD)

Also, you'll need a USB Keyboard and HDMI Monitor to set it up.  But
once you are done, you can remove those and leave it headless.
This means you'll be setting it up with SSH.

I purchased a case for my RPi as well.  There are all different
kinds but in the end I got a simple clear clamshell.  It cost me 
about ~9 USD.


=====================================================================
RASPBERRY PI SETUP:

This is not meant to be a tutorial for your RPi.  But at a
high level, here is what you need to do:

1. Download the latest version of Raspbian (Debian Weezy) from
the raspberrypi.org website.

2. Follow there instructions on installing the image on your
Micro SD card.

3. Boot up your Raspberry Pi and do your based configuration.
Make sure you enable SSH.  If you bought a WiFi adapter, set
it up as well.

NOTE:  With Ethernet or WiFi, make sure you configure a 
STATIC IP address.  This will make it easier for your RunUO
Client.

4. Log in to your RPi and SUDO SU - to root.

5. Perform an apt-get upgrade

6. Perform an apt-get update
Not sure if this is needed, but do it to be safe

7. Perform an apt-get install mono-complete
Mono is what is used to run RunUO on Liunx


=====================================================================
PRE RUNUO SETUP:

1. As root, create a user called "uo".  It's not a good thing
to run apps as root for secutiy sake.

2. As root, create two directories:

   /opt/runuo_rpi
   /opt/uo

3. As root, give ownership rights of the two directories to
the 'uo' account:

   chown uo:uo /opt/runuo
   chown uo:uo /opt/uo

4. As uo, move into the OPT directory

   cd /opt

5. Perform a Git clone to download the latest RunUO code

   git clone https://github.com/macnlos/runuo_rpi.git

6. I'm assuming you have the UO Client downloaded on your computer.
Zip up the entire UO directory into a zip file called uo.zip.  Now
you need to copy that uo.zip file to your RPi.  I do mine with
PuTTYSCP, you can do it with a memory stick or what ever method
works for you.  Place it home directory of 'uo'.

7. Unzip the contents of the uo.zip from you home directory and
into the /opt/uo directory.  RunUO needs the data files from 
this client to operate.  IMPORTANT:  I've hard coded RunUO to look
for these files in /opt/uo.  If you want to move it then you
will need to update the Scripts/Misc/Datapath.cs file.


=====================================================================
COMPILE RUNUO:

1. As uo, change into the RunUO directory

   cd /opt/runuo_rpi

2. There is a script to compile:

   ./monoBuildRunUO.sh

3. Name your shard.  This the name you will see when you connect
to the server with your client.  So as uo, edit the file:

   vi Scripts/Misc/ServerList.cs

Change the line:

   public static readonly string ServerName = "RunUO TC";

To whatever you want:

   public static readonly string ServerName = "My Shard";


=====================================================================
ITS GO TIME:

This is all that is required to get the Server side setup.  Now
you still need to make sure your UO Client on your PC is setup.
Most people use Razor or some other tool to launch the client.
This does a couple of things:

1. It handles the Encryption protocol.  The EA client uses
encryption while the RunUO server does not.  These tools remove
that encryption.

2. It allows you to specify either by name or IP@ the server.

But lets get the server started and make sure there are no
problems.  To do this:

1. As uo, 	cd /opt/runuo
2. As uo,	mono RunUO.exe

Now be patient.  The first time it runs it has to compile all of
those scripts and it takes some time.  Once it chugs along, it
should get to the point where it will ask you to create an
admin account, do so .  Once that is done you should see
something like:

  Listening: 127.0.0.1:2593
  Listening: 192.168.x.xxx:2593

This means that the server is running and lisetning for Client
connections.

Now it is time for you to point your client at the server and
connect.  When you log in, the server should display a
message about your client logging in, that is good.

Use the admin account that you entered earlier and see if it
will allow you to create a character.  Once it does, see if you
can bring up the Admin Console by typing in:

   [admin

That should bring up a GUI with admin stuff.  At this point,
you are up and running.  This isn't a full RunUO tutorial, this
is meant to get it running on the Raspberry Pi.


=====================================================================
NEXT STEPS:

If for some reason your RPi reboots and you want to have RunUO
start back automatically, I would use a combination of CRON and the
SCREEN utility.  Screen allows you to background a process on a
different virtual screen and attach/connect to it.

1. apt-get install screen  <-- it doesn't come by default.
2. Add the following line to ROOTs CRONTAB:

@reboot screen -S runuo -d -m sudo -u uo mono /opt/runuo_rpi/RunUO.exe

In the /opt/runuo_rpi directory, there is a directory called Extras.
This directory contains useful utilities that I use with my RunUO
setup.

neruns_r136 - This is the r136 release of Nerun's Distro.  This
utility will allow you to Spawn your world just like the EA/OSI
worlds.  All th doors, gates, NPCs, monster spawns, etc.  If
you want to try this, change into this directory and run the
install script.  In the "PremiumSpawner" I do the following:

1. Apocalypse now (Clear All Facets)
2. Let there be light (Create World) <-- I use ML / Mondains
3. UO MOndain's Legacy Spawns <-- I create these

This sets up the shared to before Kingdom Reborn.  That's what
I like to play with, it's up to you what you want to do.

runuo_2.4_encryption - This a utility to allow RunUo to accept
connections from a regular, encrypted UO client without using
Razor, UOAssist or other utilities.  There is an install script
in this folder too.  I'll keep it up to date with the latest
encryption keys from clients.


Here are some things I would do if I were you:

1. Install and run Nerun's Distribution.  This populates the world
and Spawns all the interest stuff.

2. Figure out a backup strategy so you don't lose your world.

3. Have fun!


