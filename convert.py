#!/usr/bin/env python

import sys, os, glob
import json

tweet_base = sys.argv[1]

# Open tweets
os.chdir(tweet_base + "/data/js/tweets")
for filename in glob.glob("*.js"):
  f = open(filename)
  lines = f.readlines()

  # Chop the first line (its javascript), parse the resulting array of tweets
  entire = ''
  for line in lines[1:]:
    entire += line
  tweets = json.loads(entire)

  # Now print, one json object per line
  for tweet in tweets:
    print json.dumps(tweet)

# Done - we've printed the tweets, one json record per line
