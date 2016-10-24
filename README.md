## playsop

Playsop is a simple bash script that helps you to play sopcast streams on your
linux machine.  

### Dependencies:
- linux machine (tested on openSUSE Leap 42.1)

- mpv player
- sp-sc-auth binary:
  http://download.sopcast.com/download/sp-auth.tgz 
  
  Please, read the Readme file in this package, about the usage and library dependency.
  If you need the stdc++5 library, download it here: 
  http://www.sopcast.com/download/libstdcpp5.tgz 
  
  Note: No need to download the libstdcpp5.tgz if you can run sp-sc.
  
## Usage
```
./plasop.sh 147067
```
where argument 147067 is the last part of the link from livetv.sx (sop://broker.sopcast.com:3912/147067)

## Note
$PLAYERTV variable in the script has hardcoded audio settings for my TV, please use $PLAYERNB variable if you want to watch football on your laptop. 

