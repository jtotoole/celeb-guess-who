require 'HTTParty'
require 'json'

choice = "2"
key_returned = ""
	
while (choice == "2") do 
	key_returned = "incorrect"
	puts "Welcome to Celebrity Guess Who! Give me an IP address!"
	IP_address = gets.chomp

	clues = HTTParty.get("http://" + IP_address)
	puts clues["results"]

	while ((key_returned == "incorrect") || (choice == "1")) do
		puts "Which celebrity might this be?"
		guess = gets.chomp.gsub(" ", "").upcase
		response = HTTParty.get("http://" + IP_address + "/" + guess)
		key_returned = response.keys[0]
		if key_returned == "incorrect"
			puts response["incorrect"]
			puts "Press '1' to guess again or '2' to move on."
			choice = gets.chomp
			key_returned = ""
		else
			puts response["incorrect"]
			choice = "2"	
		end
	end
end

