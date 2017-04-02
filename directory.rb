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

=begin
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  print "> "
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student has to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    print "> "
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end
=end

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
  puts "\nOverall, we have #{names.count} great students".center(100)
end

# nothing happens until we call the methods
# students = input_students
print_header
students_by_letter(students)
print_footer(students)
