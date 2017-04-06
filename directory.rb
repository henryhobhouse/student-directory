@students = [] # an empty array accesible to all methods

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    puts "No filename passed from command line. Would you like to enter one? "
    print ">  "
    temp_name = STDIN.gets.chomp
    if temp_name.nil?
      puts "defaulting to students.csv"
      load_students
    else
      file_checker(temp_name)
    end
  else
    file_checker(filename)
  end
end

def file_checker(filename)
  if File.exists?(filename) # if it exists
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist. Defaulting to 'students.csv'."
    load_students
  end
end

def interactive_menu
  loop do
    # 1.print the menu and ask the user what to do
    print_menu
    # 2. read the input and passes it to the process method
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to 'students.csv'"
  puts "4. Load the list from file"
  puts "9. Exit" # 9 because we'll be adding more items
  print ">  "
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  # makes function call data for use later on
  puts "\nPlease enter the names of the students"
  puts "To return to the menu, just hit return whilst leaving name empty"
  print "> "
  name = STDIN.gets.chomp # get the name
  student_input_loop(name)
  # return the array of students
end

def student_input_loop(name)
  require 'date'
  while !name.empty? do # while the name is not empty, repeat this code
  # now to get cohort
  puts "Now enter cohort month by number 1 to 12 ie. Jan = 1, May = 5 etc."
  print "> "
  month_num = gets.chomp.to_i
  puts "month_num is #{month_num}"
  # pushes user entry to date_checker function and returns the month
  month = date_checker(month_num)
  # add the student has to the array
  @students << {name: name, cohort: month}
  puts "Now we have #{@students.count} students"
  puts "\nNext name. As before leave blank if you want to return to menu"
  print "> "
  # get another name and cohort month from the user
  name = STDIN.gets.chomp
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

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
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

def print_footer (names)
  puts ""
  if names.count > 1; puts "Overall, we have #{names.count} great students".center(100)
  elsif names.count == 0; puts "We have no Students!".center(100)
  else names.count == 1; puts "Overall, we have #{names.count} great student".center(100)
  end
  puts ""
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  puts "Loaded #{@students.count} Students from #{filename}"
end

def process_file(filename)

end

# nothing happens until we call the methods
try_load_students
interactive_menu
