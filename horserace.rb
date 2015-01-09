class Horse

	attr_accessor :name
	attr_accessor :speed
	attr_accessor :hp
	attr_accessor :graphic
	attr_accessor :position
	@@horse_list = [ ]

	def initialize
		self.name = "Bob"
		self.speed = 5
		self.hp = 30
		self.graphic = "8=D"
		self.position = 0
		Horse.horse_list.push(self)
	end

	def run
		self.position = (self.speed + rand(1..5))

	end

	def trail
		"~" * self.position
	end

	def self.horse_list
		@@horse_list
	end

end

class Track

	attr_accessor :game_on
	attr_accessor :cheats

	def initialize
		self.game_on == true
		self.cheats == false
	end

	def race_intro horse1, horse2, horse3, horse4
		puts "=" * 80
		puts "HORSE RACE TURBO".center(80)
		puts "=" * 80
		blah = gets.chomp
		system("clear")
		puts "Meet your horse, The Silky Biscuit:"
		puts "#{horse1.graphic}".center(36)
		puts "His fine breeding is evident in the curves of his S"
		puts "Hit any key to agree"
		blah = gets.chomp
		puts "Race starting soon!"
		self.draw_track horse1, horse2, horse3, horse4
		puts "Press anything to start the show"
		blah = gets.chomp
end

	def draw_track horse1, horse2, horse3, horse4
		puts "#{horse1.trail}#{horse1.graphic}"
		puts "-" * 50
		puts "#{horse2.trail}#{horse2.graphic}"
		puts "-" * 50
		puts "#{horse3.trail}#{horse3.graphic}"
		puts "-" * 50
		puts "#{horse4.trail}#{horse4.graphic}"
	end

	def victory horse1, horse2, horse3, horse4
		if horse1.position >= 40
			puts "Congrats to #{horse1.name}!"
			self.game_on = false
		elsif horse2.position >= 40
			puts "Congrats to #{horse2.name}!"
			self.game_on = false
		elsif horse3.position >= 40
			puts "Congrats to #{horse3.name}!"
			self.game_on = false
		elsif horse4.position >= 40
			puts "Congrats to #{horse4.name}!"
			self.game_on = false
		end
	end

	def cheatending
		if self.cheats == true && self.game_on == false
			puts "You won, but at what cost?"
			exit
		end
	end

	def cheating horse1
			puts "The Silky Biscuit's turbos spools up! How did no one notice those?!"
			horse1.position += 20
			self.cheats = true
	end

	def race horse1, horse2, horse3, horse4
		until self.game_on == false 
		system ("clear")
		horse1.position += horse1.run
		horse2.position += horse2.run
		horse3.position += horse3.run
		horse4.position += horse4.run
		self.draw_track horse1, horse2, horse3, horse4
		self.victory horse1, horse2, horse3, horse4
		self.cheatending
		if self.game_on == false
			exit
		end
	puts "Limit break y/n?"
	answer = gets.chomp.downcase
		if answer == "y" then
		self.cheating horse1
		elsif answer == "n"
		puts "Ok, sure."
		end
	end
end


horse1 = Horse.new
horse1.name = "The Silky Biscuit"
horse1.speed = 5
horse1.hp = 30
horse1.graphic = "TSB"

horse2 = Horse.new
horse2.name = "Freddy Four Fingers"
horse2.speed = 4
horse2.hp = 50
horse2.graphic = "FFF"

horse3 = Horse.new
horse3.name = "The Khan of Khans"
horse3.speed = 6
horse3.hp = 80
horse3.graphic = "TKK"

horse4 = Horse.new
horse4.name = "Sally Pink Socks"
horse4.speed = 4
horse4.hp = 40
horse4.graphic = "SPS"

race = Track.new


race.race_intro horse1, horse2, horse3, horse4
race.race horse1, horse2, horse3, horse4

end