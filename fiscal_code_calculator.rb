#!<your ruby path>

puts "I am an italian fiscal code calculator\nWhat is your last name?"

fiscal_code = ""
last_name = gets.chomp
last_name0 = last_name.downcase
last_name1 = last_name0.delete"aeiou -.,\/:;_1234567890"
last_name2 = last_name0.delete"bcdfghjklmnpqrstvwxyz -.,\/:;_1234567890"
i = 0
j = 0

while i <= 2 and i < last_name1.length do
	fiscal_code += last_name1[i]
	i += 1
end

while fiscal_code.length < 3 and j < last_name2.length do
	fiscal_code += last_name2[j]
	j +=1
end

while fiscal_code.length < 3 do
	fiscal_code += "x"
end

puts "Ok\nNow tell me what is your first name"
first_name = gets.chomp
first_name0 = first_name.downcase
first_name1 = first_name0.delete"aeiou -.,\/:;_1234567890"
first_name2 = first_name0.delete"bcdfghjklmnpqrstvwxyz -.,\/:;_1234567890"
i = 0
j = 0

if first_name1.length >= 4
	fiscal_code += first_name1[0]
	fiscal_code += first_name1[2]
	fiscal_code += first_name1[3]
end

if first_name1.length < 4
	while i <= 2 and i < first_name1.length do
		fiscal_code += first_name1[i]
		i += 1
	end

	while fiscal_code.length < 6 and j < first_name2.length do
		fiscal_code += first_name2[j]
		j += 1
	end

	while fiscal_code.length < 6 do
		fiscal_code += "x"
	end

end

puts "You are doing well\nPlease tell me what is your year of birth"
year_of_birth = gets.chomp

if year_of_birth.length == 4
	fiscal_code += year_of_birth[2]
	fiscal_code += year_of_birth[3]
end

if year_of_birth.length == 2
	fiscal_code += year_of_birth
end

puts "Be patient\nWhat is your month of birth?"
month_of_birth = gets.chomp
m = month_of_birth.downcase

if m == "january"
	fiscal_code += "a"
end

if m == "february"
	fiscal_code += "b"
end

if m == "march"
	fiscal_code += "c"
end

if m == "april"
	fiscal_code += "d"
end

if m == "may"
	fiscal_code += "e"
end

if m == "jule"
	fiscal_code += "h"
end

if m == "july"
	fiscal_code += "l"
end

if m == "august"
	fiscal_code += "m"
end

if m == "september"
	fiscal_code += "p"
end

if m == "ottober"
	fiscal_code += "r"
end

if m == "november"
	fiscal_code += "s"
end

if m == "december"
	fiscal_code += "t"
end

puts "We have quite finished\nWhat is your day of birth?"

day_of_birth = gets.chomp

puts "And you are male or female?"

gender = gets.chomp
g = gender.downcase

if day_of_birth.length == 1
	day_of_birth = "0" + day_of_birth
end

if g == "female"
	day_of_birth0 = day_of_birth.to_i
	day_of_birth0 += 40
	day_of_birth = day_of_birth0.to_s
end

fiscal_code += day_of_birth

puts "This is the last question\nWhere did you born?"

town = gets.chomp

t = town.capitalize

require 'mysql'

begin
	
	con = Mysql.new '<yourhost>', '<yourmysqluser>', '<yourmysqlpassword>', '<yourmysqldatabase>'
	list= con.query("SELECT code FROM list_of_town WHERE town=\"#{t}\"")
	town_code = list.fetch_row
	if town_code == nil
		puts "Sorry, but I was not able to find your town\nTry to retype it correclty"
	else
		control=false
	end
	
	rescue Mysql::Error => e
		puts e.errno
		puts e.error
		
	ensure
		con.close if con
end

fiscal_code += town_code[0]
f = fiscal_code.downcase

i = 0
j = 1
x = 0

while i <= 14
	if f[i] == '0' or f[i] == 'a'
		x += 1
	end

	if f[i] == '2' or f[i] == 'c'
		x += 5
	end

	if f[i] == '3' or f[i] == 'd'
		x += 7
	end

	if f[i] == '4' or f[i] == 'e'
		x += 9
	end

	if f[i] == '5' or f[i] == 'f'
		x += 13
	end

	if f[i] == '6' or f[i] == 'g'
		x += 15
	end

	if f[i] == '7' or f[i] == 'h'
		x += 17
	end

	if f[i] == '8' or f[i] == 'i'
		x += 19
	end

	if f[i] == '9' or f[i] == 'j'
		x += 21
	end

	if f[i] == 'k'
		x += 2
	end

	if f[i] == 'l'
		x += 4
	end

	if f[i] == 'm'
		x += 18
	end

	if f[i] == 'n'
		x += 20
	end

	if f[i] == 'o'
		x += 11
	end

	if f[i] == 'p'
		x += 3
	end

	if f[i] == 'q'
		x += 6
	end

	if f[i] == 'r'
		x += 8
	end

	if f[i] == 's'
		x += 12
	end

	if f[i] == 't'
		x += 14
	end

	if f[i] == 'u'
		x += 16
	end

	if f[i] == 'v'
		x += 10
	end

	if f[i] == 'w'
		x += 22
	end

	if f[i] == 'x'
		x += 25
	end

	if f[i] == 'y'
		x += 24
	end

	if f[i] == 'z'
		x += 23
	end

	i += 2
end

while j <= 13
	if f[j] == '1' or f[j] == 'b'
		x += 1
	end

	if f[j] == '2' or f[j] == 'c'
		x += 2
	end

	if f[j] == '3' or f[j] == 'd'
		x += 3
	end

	if f[j] == '4' or f[j] == 'e'
		x += 4
	end

	if f[j] == '5' or f[j] == 'f'
		x += 5
	end

	if f[j] == '6' or f[j] == 'g'
		x += 6
	end

	if f[j] == '7' or f[j] == 'h'
		x += 7
	end

	if f[j] == '8' or f[j] == 'i'
		x += 8
	end

	if f[j] == '9' or f[j] == 'j'
		x += 9
	end

	if f[j] == 'k'
		x += 10 
	end

	if f[j] == 'l'
		x += 11
	end

	if f[j] == 'm'
		x += 12
	end

	if f[j] == 'n'
		x += 13
	end

	if f[j] == 'o'
		x += 14
	end

	if f[j] == 'p'
		x += 15
	end

	if f[j] == 'q'
		x += 16
	end

	if f[j] == 'r'
		x += 17
	end

	if f[j] == 's'
		x += 18
	end

	if f[j] == 't'
		x += 19
	end

	if f[j] == 'u'
		x += 20
	end

	if f[j] == 'v'
		x += 21
	end

	if f[j] == 'w'
		x += 22
	end

	if f[j] == 'x'
		x += 23
	end

	if f[j] == 'y'
		x += 24
	end

	if f[j] == 'z'
		x += 25
	end

	j += 2
end

r = x % 26

if r == 0
	f += 'a'
end

if r == 1
	f += 'b'
end

if r == 2
	f += 'c'
end

if r == 3
	f += 'd'
end

if r == 4
	f += 'e'
end

if r == 5
	f += 'f'
end

if r == 6
	f += 'g'
end

if r == 7
	f += 'h'
end

if r == 8
	f += 'i'
end

if r == 9
	f += 'j'
end

if r == 10
	f += 'k'
end

if r == 11
	f += 'l'
end

if r == 12
	f += 'm'
end

if r == 13
	f += 'n'
end

if r == 14
	f += 'o'
end

if r == 15
	f += 'p'
end

if r == 16
	f += 'q'
end

if r == 17
	f += 'r'
end

if r == 18
	f += 's'
end

if r == 19
	f += 't'
end

if r == 20
	f += 'u'
end

if r == 21
	f += 'v'
end

if r == 22
	f += 'w'
end

if r == 23
	f += 'x'
end

if r == 24
	f += 'y'
end

if r == 25
	f += 'z'
end

fiscal_code = f.upcase.delete" "

puts "Your fiscal code is #{fiscal_code}\nGoodbye"

