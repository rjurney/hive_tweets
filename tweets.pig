register /me/Software/elephant-bird/pig/target/elephant-bird-pig-3.0.6-SNAPSHOT.jar
register /me/Software/pig/build/ivy/lib/Pig/json-simple-1.1.jar

set elephantbird.jsonloader.nestedLoad 'true'

/* {"entities": {
      "user_mentions": [], 
      "media": [], 
      "hashtags": [], 
      "urls": []
    }, 
    "text": "700 line commit... and I'm spent.", 
    "created_at": "Sat Aug 30 09:10:28 +0000 2008", 
    "source": "web", 
    "id_str": "903831953", 
    "geo": {}, 
    "id": 903831953, 
    "user": {
      "verified": false, 
      "name": "Russell Jurney", 
      "profile_image_url_https": "https://si0.twimg.com/profile_images/2964060639/9a98c1eb08f57472743caa4a5ae3260b_normal.jpeg", 
      "protected": false, 
      "id_str": "15831927", 
      "id": 15831927, 
      "screen_name": "rjurney"
      }
    } */

tweets = load 'tweets.json' using com.twitter.elephantbird.pig.load.JsonLoader() as json:map[];
texts = foreach tweets generate $0#'text' as text, $0#'entities'#'user_mentions' as user_mentions;
test = foreach texts generate text, FLATTEN(user_mentions.name);
a = limit test 20;
dump a
