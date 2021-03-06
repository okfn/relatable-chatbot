module.exports = (robot) ->
    robot.hear /^#((reading)|(listening)|(location)|(eating)|(working)|(watching)).*/i, (msg) ->
        user = msg.message.user.name
        data =
            type: msg.match[1],
            text: msg.message.text,
            username: user,
        uri = process.env.API_ENDPOINT
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
