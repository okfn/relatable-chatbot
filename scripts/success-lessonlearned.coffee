# Description:
#   Records messages containing #success or #lessonlearned on a Google form.
# Commands:
#   #success - records the entire message as a success story.
#   #lessonlearned - records the entire message as a lesson learned.
#   #nowreading - records the entire message as a lesson learned


module.exports = (robot) ->
    robot.hear /^#((reading)|(listening)|(location)|(eating)|(working)|(watching)).*/i, (msg) ->
        user = msg.message.user.name
        data =
            type: msg.match[1],
            text: msg.message.text,
            username: user,
        uri = "http://127.0.0.1:8000/api"
        apikey = process.env.HUBOT_HASHTAG_LISTENER_KEY
        robot.http(uri)
             .header('Authorization', apikey)
             .post(JSON.stringify(data)) (err, res, body) ->
                robot.logger.debug body
                parsed = JSON.parse(body)
                if parsed.success
                    msg.send "Story recorded, #{user}!"
                    msg.send parsed.message
                    return
                msg.send "Something went wrong with recording your story: #{parsed.message}"
