# Relatable chatbot

This is a version of hubot, the chatbot by github. Find more information about hubot itself and how to develop for it in the [hubot documenation](https://hubot.github.com/docs/).

It is ment to be included in a channel on slack (or another chat app) where it listens for certain messages.

Those messages should start with `#reading` `#listening`  `#working` or  any other keywords defined in `scripts/relatable-tags.coffee`.

The messages that start with those strings will then be set to an API endpoint where they are parsed further.

In the specific case of this bot they are sent to Open Knowledge International's website where they are used to update what people are currently working on/listening to etc.

There are a couple of environment variables that need to be set for the bot to work:

```
API_ENDPOINT:               <where the message should be send>
HUBOT_HASHTAG_LISTENER_KEY: <the basic auth token for the api endpoint (set in the website config)>
HUBOT_SLACK_TOKEN:          <the token that you get from slack>
HUBOT_URL:                  <the url under which this bot is running>
REDISTOGO_URL:              <automatically configured by heroku>
```
