# Purpose
The script will display in console and write the current Raspberry Pi temperature to a file.  It relies on the internal file that the Pi writes to.  You probably need you to change the owner or set executable permissions to run.

I wrote the script because I wanted to keep track of the history of the temperature, not just the current temperature that the GUI panel displays.

It defaults to printing out the temperatures and writing them out to a file.  The default file is ~/Documents/temps.txt.

Feel free the change whatever you like.

I've added a small TODO list for things I want to implement to make this better and more diverse.

# Usage

### Basic usage

```bash
# make yourself the owner
sudo chown USER temperature.sh

# make the script executable
sudo chmod +x temperature.sh

# run the script
./temperature.sh
# run the script in the background (bug: it still prints out in
# the current terminal, so it looks like it's taking over)
./temperature.sh &
```

# Extra

References are listed in the script file.

As with all scripts you find, read them yourself before executing them.

- Max
- BITS: Bachelor of Information Technology Student


# Changes

- 1.0 initial script, printed and wrote out temps to a file
- 1.1 updated with a todo list, started laying out a plan for updates

# TODO

- Style: have temperature ranges have coloured output
- Output: have a passable argument to decide whether to write or print
- Output: have option/argument to only process high temperatures
- Output: have checking time a passable argument
- Output: have argument to specify an output file
- System: have option to grab the CPU/Memory heavy processes running

