Hi, the script will display in console and write the current Raspberry Pi temperature to a file.  It relies on the internal file that the Pi writes to.  You probably need you to change the owner or set executable permissions to run.

I wrote the script because I wanted to keep track of the history of the temperature, not just the current temperature that the GUI panel displays.

The script currently writes out to the same place as the script itself, so feel free to change that (and edit it in any way you like).

```bash
sudo chown USER temperature.sh

sudo chmod +x temperature.sh

./temperature.sh
OR
./temperature.sh &
```

Delete/comment the lines, change some things, have some fun with it, do whatever you want.

References are listed in the script file.

As with all scripts you find, read them yourself before executing them.

- Max
