# Catch

Simple ChucK code to implement concepts from my Category Theory article.

# Here you will find:

* Mn.ck: code that implements low level integer to frequency translation. It's the Mn set that's defined in the presentation.
* transp[2].ck: These two files implement some simple transpositions of a melody using morphisms in Set, or for the normal people, functions.
* music.ck, harmony.ck: Here is implemented an example of (note,duration) tuple and how it sounds. harmony.ck is merely the same song being played in and harmony and will likely be moved to music.ck when I learn how to use shreds
* scale.ck: Is an example of morphisms of scales and the different sounds it can give to the same melody.

# How to run

You must have chuck installed. In the command line you can, for instance, type:

    $ chuck Mn.ck transp.ck
    $ chuck Mn.ck music.ck harmony.ck

Notice that all the examples use the Mn class, so you must include Mn.ck in the command line that calls chuck.

# Installing Chuck and references

* ChucK website: http://chuck.cs.princeton.edu/
* The excellent ChucK tutorials: in the ChucK website
* My article (in portuguese) : http://dl.dropbox.com/u/2701879/uacptm_artigo.pdf
* My presentation (in portuguese) : http://dl.dropbox.com/u/2701879/uacptm_slides.pdf

