require 'facebook/messenger'
class User < ActiveRecord::Base
	include Facebook::Messenger

    def send_welcome_message(messenger_id)
    	message = 'السلام عليكم :) مرحبا بك في أول تطبيق إسلامي من نوعه على الفيسبوك سنقوم بإرسال آيات و أحاديث شريفة يوميا إليك .. نرجو لك الفائدة و الأجر'
        send_message(message, messenger_id)
    end

    def send_message(message, messenger_id)
		Bot.deliver({
				recipient: {
					id: messenger_id
				},
				message: {
					text: message
					}
				}, access_token: ENV['app_token'])
	end

	def self.send_all(message)
		User.all.each{|user|
			send_message(message, use.messenger_id)
		}
	end
end
