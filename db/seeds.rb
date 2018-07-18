# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name => 'Chicago' }, { name => 'Copenhagen' }])
#   Mayor.create(name => 'Emanuel', city => cities.first)

admin = User.create(:login => "admin", :password => "P4ssw0rd", :password_confirmation => "P4ssw0rd")
user1 = User.create(:login => "user1", :password => "P4ssw0rd", :password_confirmation => "P4ssw0rd")
user2 = User.create(:login => "user2", :password => "P4ssw0rd", :password_confirmation => "P4ssw0rd")

revengers_synopsis = "When a malicious entity with dubious motivations threatens Earth with epic CG explosions, \
an unlikely band of heroes teams up to shatter previous box-office records."

arachnidman_synopsis = "When Harry Horker got bitten by a radioactive spider, he had no idea that he'd grow \
four more arms, six more eyes, and spin webbing from somewhere in his nether regions. And that because this \
made him hideous rather than cool looking, he'd have to play the villain against the more visually appealing \
Geckoman in an epic role-reversal. But like Harry's uncle once said, 'With a great number of limbs comes great
responsibility.'"

two_d_array_synopsis = "Ted thinks he has it all figured out, hacking his way through rubbish movie ticketing \
sites all day long, right up until he hacks the wrong one and ends up being chased by goons in nice suits and \
cool shades. That's when an idiot tells him that the real world isn't actually real, but is something called the \
2D Array which is created by robots to fool humans into remaining perpetually asleep while these robots spoon \
with the humans for warmth."

hungry_games_synopsis = "Ripped off a Japanese story about kids having to eat bizarre sushi, this is a tale of a \
dystopian future where colonies find the hungriest, craziest kids they can to enter into a hot dog eating contest. \
The losers get turned into hot dogs to be used for future contests."

game_of_chairs_synopsis = "In a world where a giant wall is all that separates the civilized world from beings that \
raise the undead, where dragons are returning to burn kingdoms to ashes, where a decade-long winter threatens to wipe \
out half of the population, the biggest concern is to show the audience as much nudity as physically possible."

revengers = Movie.create(:name => "The Revengers", :running_time => 135, :rating => 2, :description => revengers_synopsis)
arachnidman = Movie.create(:name => "Arachnidman", :running_time => 110, :rating => 3, :description => arachnidman_synopsis)
two_d_array = Movie.create(:name => "The 2D Array", :running_time => 120, :rating => 2, :description => two_d_array_synopsis)
hungry_games = Movie.create(:name => "The Hungry Games", :running_time => 90, :rating => 1, :description => hungry_games_synopsis)
game_of_chairs = Movie.create(:name => "Game of Chairs", :running_time => 115, :rating => 4, :description => game_of_chairs_synopsis)

abc_24_description = "This theater boasts 24 screens, stadium seating, and eye-watering concession prices. \
It has an IMAX screen, although you can barely tell. It also shows 3D movies if you're in the mood for spending \
more money in return for severely reduced image brightness and the opportunity to put some extra strain on your eyes. \
Most of the new releases play here."

rage_18_description = "Rage is a relatively new theater, using higher-quality projectors than most others. Their seats \
aren't that comfortable, though, and the screens are quite small. Also there's frequently an automobile in the theater \
lobby for some contest or other."

abc_30_description = "This theater has a weird concessions area where you gather everything and then check out at a \
register the way you would at a cafeteria. But it has booze, which gives it an edge over others. It also has 30 \
screens, one of which is an IMAX."

studio_36_description = "A gathering place for hipsters and Big Leboswki fans, this theater is a relic from the 1700s, \
when movies were just drawings on paper that people would quickly thumb through to create the illusion of animation. \
It serves alcohol and has just one screen. For some reason, the floor of the theater tilts down as you get further \
from the screen rather than up."

abc_24 = Theater.create(:name => "ABC IMAX 24", :zip => 43210, :description => abc_24_description, :ticket_price => 9.00)
rage_18 = Theater.create(:name => "Rage Motion Pictures 18", :zip => 43240, :description => rage_18_description, :ticket_price => 8.00)
abc_30 = Theater.create(:name => "ABC IMAX 30", :zip => 43219, :description => abc_30_description, :ticket_price => 9.00)
studio_36 = Theater.create(:name => "Studio 36", :zip => 43209, :description => studio_36_description, :ticket_price => 5.00)

s1 = Showtime.create(:movie => revengers, :theater => abc_24, :time => '6:00', :seats_available => 300, :tickets_sold => 0)
s2 = Showtime.create(:movie => revengers, :theater => abc_24, :time => '9:00', :seats_available => 300, :tickets_sold => 0)
s3 = Showtime.create(:movie => arachnidman, :theater => abc_24, :time => '4:00', :seats_available => 300, :tickets_sold => 0)
s4 = Showtime.create(:movie => arachnidman, :theater => abc_24, :time => '6:30', :seats_available => 0, :tickets_sold => 300)
s5 = Showtime.create(:movie => arachnidman, :theater => abc_24, :time => '9:00', :seats_available => 2, :tickets_sold => 298)
s6  = Showtime.create(:movie => two_d_array, :theater => abc_24, :time => '6:00', :seats_available => 1, :tickets_sold => 299)
s7  = Showtime.create(:movie => two_d_array, :theater => abc_24, :time => '8:30', :seats_available => 300, :tickets_sold => 0)
s8  = Showtime.create(:movie => hungry_games, :theater => abc_24, :time => '5:30', :seats_available => 0, :tickets_sold => 300)
s9  = Showtime.create(:movie => hungry_games, :theater => abc_24, :time => '7:30', :seats_available => 0, :tickets_sold => 300)
s10  = Showtime.create(:movie => game_of_chairs, :theater => abc_24, :time => '9:00', :seats_available => 300, :tickets_sold => 0)
s11  = Showtime.create(:movie => revengers, :theater => rage_18, :time => '6:00', :seats_available => 300, :tickets_sold => 0)
s12  = Showtime.create(:movie => revengers, :theater => rage_18, :time => '8:30', :seats_available => 300, :tickets_sold => 0)
s13  = Showtime.create(:movie => revengers, :theater => rage_18, :time => '11:00', :seats_available => 300, :tickets_sold => 0)
s14  = Showtime.create(:movie => arachnidman, :theater => rage_18, :time => '5:00', :seats_available => 300, :tickets_sold => 0)
s15  = Showtime.create(:movie => arachnidman, :theater => rage_18, :time => '8:00', :seats_available => 0, :tickets_sold => 300)
s16  = Showtime.create(:movie => two_d_array, :theater => rage_18, :time => '5:00', :seats_available => 300, :tickets_sold => 0)
s17  = Showtime.create(:movie => two_d_array, :theater => rage_18, :time => '7:30', :seats_available => 300, :tickets_sold => 0)
s18  = Showtime.create(:movie => two_d_array, :theater => rage_18, :time => '10:00', :seats_available => 300, :tickets_sold => 0)
s19  = Showtime.create(:movie => hungry_games, :theater => rage_18, :time => '4:30', :seats_available => 0, :tickets_sold => 300)
s20  = Showtime.create(:movie => hungry_games, :theater => rage_18, :time => '6:30', :seats_available => 5, :tickets_sold => 295)
s21  = Showtime.create(:movie => hungry_games, :theater => rage_18, :time => '8:30', :seats_available => 300, :tickets_sold => 0)
s22  = Showtime.create(:movie => revengers, :theater => abc_30, :time => '6:15', :seats_available => 300, :tickets_sold => 0)
s23  = Showtime.create(:movie => revengers, :theater => abc_30, :time => '9:00', :seats_available => 300, :tickets_sold => 0)
s24  = Showtime.create(:movie => arachnidman, :theater => abc_30, :time => '5:30', :seats_available => 300, :tickets_sold => 0)
s25  = Showtime.create(:movie => arachnidman, :theater => abc_30, :time => '8:00', :seats_available => 300, :tickets_sold => 0)
s26  = Showtime.create(:movie => arachnidman, :theater => abc_30, :time => '10:30', :seats_available => 0, :tickets_sold => 300)
s27  = Showtime.create(:movie => two_d_array, :theater => abc_30, :time => '7:00', :seats_available => 300, :tickets_sold => 0)
s28  = Showtime.create(:movie => two_d_array, :theater => abc_30, :time => '10:00', :seats_available => 300, :tickets_sold => 0)
s29  = Showtime.create(:movie => hungry_games, :theater => abc_30, :time => '5:00', :seats_available => 0, :tickets_sold => 300)
s30  = Showtime.create(:movie => hungry_games, :theater => abc_30, :time => '7:00', :seats_available => 300, :tickets_sold => 0)
s31  = Showtime.create(:movie => hungry_games, :theater => abc_30, :time => '9:00', :seats_available => 0, :tickets_sold => 300)
s32  = Showtime.create(:movie => two_d_array, :theater => studio_36, :time => '6:45', :seats_available => 300, :tickets_sold => 0)
s33  = Showtime.create(:movie => game_of_chairs, :theater => studio_36, :time => '6:00', :seats_available => 300, :tickets_sold => 0)
s34  = Showtime.create(:movie => game_of_chairs, :theater => studio_36, :time => '9:00', :seats_available => 300, :tickets_sold => 0)

