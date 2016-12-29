require 'facebook/messenger'
class User < ActiveRecord::Base
	include Facebook::Messenger

    def self.send_welcome_message(messenger_id)
    	message = 'السلام عليكم :) مرحبا بك في أول تطبيق إسلامي من نوعه على الفيسبوك سنقوم بإرسال آيات و أحاديث شريفة يوميا إليك .. نرجو لك الفائدة و الأجر ، هذا التطبيق يرسل الرسائل بشكل تلقائي و لا حجاة للتفاعل معه'
        send_message(message, messenger_id)
    end

    def self.send_message(message, messenger_id)
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
			send_message(message, user.messenger_id)
		}
	end
end
