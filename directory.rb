=begin
# the list of students in an array
students = [
  {name: "Dr Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},
]
=end

def date_checker(month_num)
  if month_num.between?(1,12)
    Date::MONTHNAMES[month_num]
  else
    puts "\nThat month doesn't exist! I'm therefore putting this month as too lazy to create block so you can get it right!"
    Date::MONTHNAMES[Date.today.month]
  end
end

def input_students
  #makes function call data for use later on
  require 'date'
  puts "Please enter the names of the students"
  puts "To finish, just hit return whilst leaving name empty"
  print "> "
  # create an empty array
  students = []
  # get the name
  name = gets.chomp
  # now to get cohort
  puts "Now enter cohort month by number 1 to 12 ie. Jan = 1, May = 5 etc."
  print "> "
  month_num = gets.chomp.to_i
  puts "month_num is #{month_num}"
  # pushes user entry to date_checker function and returns the month
  month = date_checker(month_num)
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student has to the array
    students << {name: name, cohort: month}
    puts "Now we have #{students.count} students"
    puts "\nNext name. As before leave blank if you want to exit/finished"
    print "> "
    # get another name and cohort month from the user
    name = gets.chomp
    puts "Their cohort month (1 to 12)..."
    print "> "
    month_num = gets.chomp.to_i
    # pushes user entry to date_checker function and returns the month
    month = date_checker(month_num)
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villians Academy".center(100)
  puts "-------------\n".center(100)
end
=begin
# changed method to non standard ruby call (print)
def print_name(names)
  names.each_with_index{ |val, index| puts "#{index + 1}: #{val[:name]} (#{val[:cohort]} cohort)" }
end
=end

# lists the students based on fist character in their name determined by the user
def students_by_letter (students)
  puts "This will list students using a while loop\n".center(100)
    index = 0
    while index < students.count
       puts "#{index + 1}: #{students[index][:name]} of #{students[index][:cohort]} cohort".center(100, '-')
       index += 1
    end
end

def print_footer (names)
  puts ""
  puts "Overall, we have #{names.count} great students".center(100)
end

# nothing happens until we call the methods
students = input_students
print_header
students_by_letter(students)
print_footer(students)
