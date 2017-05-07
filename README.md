# droiddump

These are simple bash scripts I use to exfiltrate and infiltrate data from my
phone. They are small wrappers around rsync, which I use on my phone thank to
[SSHelper](https://arachnoid.com/android/SSHelper/).


## droidump.sh

I place a low amount of trust in my phone. There is only a small amount of data
on it that I care about. Things like photos, which are no good until they're
moved off the phone. And some config files, which make it quicker to get things
running after a reset or on a new device. Remembering which arcane paths I care
about is a pain. This script simply stores these paths in an array and rsyncs
them to my computer.


## droidpush.sh

I don't pretend to understand how Android works. I feel stupidier every time I
attempt to understand how data is supposed to be stored and the permission
issues with different directories and SD cards. What I have discovered is that
I can create an `Android/data/com.arachnoid.sshelper` directory on the SD card,
and that SSHelper will then have permission to do whatever it wants within
there. This means I can run rsync with options like `--delete` or even SSH in
to that directory and -- for a short period of time -- fool myself into
thinking I'm on a real computer. I treat that directory as my home dir. This
script lets me sync directories from my computer into this special directory on
the phone. I use it to transfer music.
