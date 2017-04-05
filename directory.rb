@students = [] # an empty array accesible to all methods

=begin
# the list of students in an array
students = [
  {name: "Dr Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :october},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :august},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :august},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november},
]
=end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items
  print ">  "
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    # 1.print the menu and ask the user what to do
    print_menu
    # 2. read the input and passes it to the process method
    process(gets.chomp)
  end
end

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
    @students << {name: name, cohort: month}
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
end


def print_header
  puts "The students of Villians Academy".center(100)
  puts "-------------\n".center(100)
end

# changed method to non standard ruby call (print)
def print_students_list(names)
  names_group = names.group_by { |x| x[:cohort] }
  names_group.each do |cohort, names|
    puts ""
    puts "#{cohort.capitalize}:".center(10)
    names.each_with_index{ |x, index| puts "#{index + 1}: #{x[:name].capitalize} ".center(100) }
  end
end

=begin
# lists the students based on fist character in their name determined by the user
def students_print_by_month (students)
  puts "This will list students using a while loop\n".center(100)
    students.each{|}
       puts "#{index + 1}: #{students[index][:name]} of #{students[index][:cohort]} cohort".center(100, '-')
       index += 1
    end
end
=end

def print_footer (names)
  puts ""
  if names.count > 1; puts "Overall, we have #{names.count} great students".center(100)
  elsif names.count == 0; puts "We have no Students!".center(100)
  else names.count == 1; puts "Overall, we have #{names.count} great student".center(100)
  end
end

# nothing happens until we call the methods
interactive_menu
