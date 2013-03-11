import sys, os, glob
import json

# Open tweets
os.chdir("tweets")
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
