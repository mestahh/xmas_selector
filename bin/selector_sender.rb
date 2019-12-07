require 'mail'
require 'selector'

options = { :address              => "smtp.gmail.com",
            :port                 => 465,
            :domain               => 'mail.google.com',
            :user_name            => 'user_name',
            :password             => 'app_password',
            :authentication       => :login,
            :ssl                  => true,
            :openssl_verify_mode  => 'none'
          }
Mail.defaults do
  delivery_method :smtp, options
end

def mail_that(recipient = 'test@test.com',subjects="test",body_message="test")
  Mail.deliver do
         to recipient
       from 'jesus.c@heavenandco.com'
    subject subjects
       body body_message
  end
end

members = [
	# Member.new('Anyu', ['Apu'], 'anyu@gmail.com')
	# Member.new('Apu', ['Apu'], 'anyu@gmail.com')
	# Member.new('Mama', ['Papa'], 'mama@gmail.com')
	# Member.new('Papa', ['Mama'], 'papa@gmail.com')
	# Member.new('Lalika', [], 'lali@gmail.com')
	# Member.new('Lilike', [], 'lili@gmail.com')
]

after_selection = Selector.new(members).select_member

after_selection.each do |m|
	mail = "Kedves #{m.name}! Szerettel értesítelek, hogy idén az általad húzott személy: #{m.chosen}. Üdvözlettel, E-Jézus."
	mail_that(m.email, 'Idei karácsonyi húzás értesítő', mail)
	puts "Mail sent to #{m.email}"
end


