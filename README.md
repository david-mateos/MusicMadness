# MusicMadness
It's March Madness but for music. 

These mix of scripts create a pdf bracket tournament from an Artist's discography. The python script takes a Spotify playlist id
that should ideally hold a large sample of an artist's material. The bigger the playlist the better the bracket. 
After a csv is generated from the playlist id, the r script creates seeds by looking at the top 64/32 tracks by 'popularity'. 


This process works for artists who have released at least 3 albums. The makeBracket files each correspond to either a 32 or 64 
size bracket.

My friend, Ishan Guru contributed some very helpful python to this project. 
