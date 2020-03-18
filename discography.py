#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Form a KO style tournament from an artist's tracks.

Use a playlist or combination of playlists to build
a proxy discography to get to at least 64 tracks.

Output a csv file to be read by seperate R script 
to make a full bracket. 
"""

import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import os
import csv

os.environ['SPOTIPY_CLIENT_ID'] = '' # your credentials
os.environ['SPOTIPY_CLIENT_SECRET'] = ''
sp = spotipy.Spotify(client_credentials_manager=SpotifyClientCredentials())

def get_tracks(playlist_ids):

    playlistJSON = []
    track_ids = []
    offset = 0
    for playlist in playlist_ids:
        while True:    
            response = sp.playlist_tracks(playlist,
                                          offset=offset,
                                          fields=
                                          'items.track.id')    
            playlistJSON.extend(response['items'])
            offset = offset + len(response['items']) # if there 100+ tracks    
            if len(response['items']) == 0:
                break   
        for i, track in enumerate(playlistJSON):
            track_ids.append(track['track']['id'])    
        offset = 0    
        playlistJSON = []
    return track_ids

def get_track_popularity(track_ids):
    pop = {}
    results = sp.tracks(track_ids, market='US')
    for i, track in enumerate(results['tracks']):
        pop[(track['name'])] = track['popularity']
    return pop

def get_track_artist(track_ids):
    artist = {}
    results = sp.tracks(track_ids, market='US')
    for i, track in enumerate(results['tracks']):
        artist[(track['name'])] = track['artists'][0]['name']
    return artist


if __name__ == "__main__":
    
   discography = [''] # playlist ID here
   all_tracks = get_tracks(discography)
   
   if len(all_tracks) >= 32:
       
       n = 50 # spotify only lets us do this 50 tracks at a time
       chunk = [all_tracks[i:i + n] for i in range(0, len(all_tracks), n)]
       
       all_popularities = {}
       track_artist = {}
       for element in list(chunk):
           all_popularities.update(get_track_popularity(element))
           track_artist.update(get_track_artist(element))
       
       output_file = 'bracket_tracks.csv'
       data = [all_popularities.keys(),all_popularities.values(),track_artist.values()]
       with open(output_file, 'w') as f:
           w = csv.writer(f)
           w.writerows(zip(*data))
           
   else:
       print("Not enough tracks.")
