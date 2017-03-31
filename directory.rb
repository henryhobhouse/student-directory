# the list of students in an array
students = [
  "Dr Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Nomran Bates",
]
# and then prints them
puts "The students of Villians Academy"
puts "-----------"
students.each{ |student| puts student }

# displaying the number of students
puts "Overall, we have #{students.count} great students"
