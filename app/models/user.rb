require 'facebook/messenger'
class User < ActiveRecord::Base
	include Facebook::Messenger

	def self.send_message(message)
		User.all.each{|user|
			Bot.deliver({
				recipient: {
					id: user.messenger_id
				},
				message: {
					text: message
					}
				}, access_token: ENV['app_token'])
		}
	end
end
