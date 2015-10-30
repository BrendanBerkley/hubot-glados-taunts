# Description:
#   Aperture Science Insult Core for Robotic Lifeforms (Unofficial)
#   GLaDOS taunts adapted from http://theportalwiki.com/wiki/GLaDOS_voice_lines
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot taunt <optional @username>
#
# Author:
#   Brendan <me@brendanberkley.com>

module.exports = (robot) ->

	# http://stackoverflow.com/a/196991/945370
	toTitleCase = (str) ->
		return str.replace(/\w\S*/g, (txt) -> return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase())

	taunts = ["You did so well, I'm going to note this on your file, in the commendations section. Oh, there's lots of room here. 'Did...well...enough.'", "Look at you. Sailing through the air majestically. Like an eagle. Piloting a blimp.", "Here come the test results: You are a horrible person. I'm serious, that's what it says: A horrible person. We weren't even testing for that.", "I'm afraid you're about to become the immediate past president of the Being Alive club.", "Let's give your parents a call right now. [phone ringing] The birth parents you are trying to reach do not love you. Please hang up. [Dial tone]", "Remember before when I was talking about smelly garbage standing around being useless? That was a metaphor. I was actually talking about you. And I'm sorry. You didn't react at the time, so I was worried it sailed right over your head. Which would have made this apology seem insane. That's why I had to call you garbage a second time just now.", "Well done! You must be the pride of <Subject Hometown Here>.","The Enrichment Center would like to remind you that you will be baked, and then there will be cake."]

	robot.respond /taunt?\s?(?:@(\w*))?/i, (res) ->
		taunt = res.random taunts
		if res.match[1]
			tauntCase = taunt
			if taunt.charAt(0) != "I"
				tauntCase = taunt.charAt(0).toLowerCase() + taunt.substr(1)
			taunt = "#{toTitleCase(res.match[1])}, " + tauntCase
		res.send taunt