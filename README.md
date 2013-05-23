Erlang
======

Code practice as I learn to program with Erlang


-Note -- I have completed the Edx.org course CS50x (Harvard) Intro to Computer Science
This course uses C (with some PHP at the end) for lectures and problem sets.

I am re-coding / porting the problem sets into Erlang and adding them here

---------------Update 5/21 -------------
Added fizzbuzz.erl (checks if an argument is a multiple of 3 or 5)

Added sums.erl. sum/1 function will sum all integers between 1 and the argument. sum/2 adds all integers 
between the arguments as long as the first is the smaller. For example sum(1,3) returns 6. sum (3,1) is an error.

both of the above are exercises from the OReilly 'Erlang Programming' book

Added caesar.erl which will take a string and a key and "encrypt" the string by adding the key value as an offset.
For example, if caesar:main("A", 2). is entered, "C" is returned.  The function also decrypts
ways to improve this: 1) pass in a file 2) allow a user to pass a parameter/flag to encrypt or decrypt along with the
string & key value.  

this was an assignment for CS50x (edx) that I ported to erlang from C

-----------------------------------------
-------------Update 5/23-----------------
Added ch3lists.erl (ex 3-5) filter, reverse, concatenate & flatten lists

Added ch3db.erl (ex 3-4) simple pseudo-database using lists : new, write, read, match, delete, destroy data

Added ch3sort.erl (ex 3-6) quick sort & merge sort using lists 
-----------------------------------------
