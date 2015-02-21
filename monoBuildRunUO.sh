# Compile RunUO.exe with Mono
dmcs -optimize+ -unsafe -t:exe -out:RunUO.exe -win32icon:Server/runuo.ico -nowarn:219,414 -d:MONO -recurse:Server/*.cs

# Testing to make sure the libz.so file is present where expected
if [ -a /lib/arm-linux-gnueabihf/libz.so.1.2.7 ]
then
   echo "Found the libz.so file."
else
   echo "Did not find libz.so file.  To find the file, assuming the package is installed, issue:  dpkg -L zlib1g"
   echo "If the the package is not installed then as root, do an apt-get install zlib1g"
   echo "You may have to manually edit the RunUO.exe.config file to point to the correct file"
fi
