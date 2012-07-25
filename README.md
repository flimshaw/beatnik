beatnik
=======

Beatnik Box script for generating random Beatnik poetry.  I made this for an experimental video project back in 2003, when I was like 20 years old.  It was pretty much the first program I ever wrote.  In the end, the device that used it looked sort of like a 386 threw up in a fishtank.  See here: http://www.flickr.com/photos/mrquint15/550240120/

how does it work?
================

The Beatnik script is pretty damn simple.  It has a few dictionaries grouped by part of speech, all in text files in this case since I didn't know what a database was at the time, probably.  So to generate a poem it:

1.  Generates a random length (in words) for each line, and a line count
2.  Generates a sentence by placing a random part of speech tag for the first word, then adding a part of speech that can follow it, and so on until the end of the sentence.
3.  Loops through and places a random word for each part of speech tag that makes up the sentence
4.  Prints out the poem

why are the poems actually kinda good?
======================================

Turns out, if you write poems using the same words Allen Ginsberg used to write Howl, along with some other words from The Lovesong of J. Alfred Prufrock, even a computer can sometimes write something pretty good.

You can try the poetry machine out at my website.  A new poem is generated each time you refresh: 

=> http://flimshaw.net/beatnik/

do you save the poems anywhere?
===============================

Nope.  Isn't that sad?  They all just go away, unless you save them.  I do have a tumblr that generates a new one each day.  You can follow it here: 

=> http://beatnikbox.tumblr.com/

*DISCLAIMER*: 
There are some questionable code comments in here, but I was 20 years
old at the time, so there's that.