# Time wizard

Pomodoro timer for your terminal.

### Installation

You can clone the repository and then install the files in the apropriate places.

```
git clone https://github.com/thekaiz3n/timewizard.git
cd justdo
sudo cp timewizard.sh /usr/bin/timewizard
cp -r .timewizard/* ~/.timewizard
```

### Usage

Run in terminal :

```
timewizard
```

run in background ( is recommeded set BAR_PROGRESS to "no" in timewizard.conf):

```
timewizard &
```

or you can name your task, customize the timer and the reminder (in minutes) like

timewizard 'some text" minutes reminder

```
timewizard "super boring work" 15 13
```

### Configuration
The file is: $HOME/.timewizard/timewizard.conf
#### Bar progress
If configured yes a progress bar is shown in the terminal.
```
# Default: yes
# Show progress bar
BAR_PROGRESS="yes"
```
#### Screen locker
If configured after the finish the screen is locked.
```
# Default locker command
locker=""
```
Recommend screen lockers:
- slock - https://tools.suckless.org/slock/
- loginctl lock-session 1 - Is used in kde plasma.

### Next in the project
- [ ] Save the time spend and sessions, track the use time.
- [ ] Add a status flag, to check the current time of jobs in background.
- [ ] Add to AUR repository.
