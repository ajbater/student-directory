@line_width = 80

def input_students
  puts "Please enter the name, cohort and additional information for each student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  cohorts = [
    "january",
    "february",
    "march",
    "april",
    "may",
    "june",
    "july",
    "august",
    "september",
    "october",
    "november",
    "december"
  ]
  # get the first names
  puts "Name: "
  name = gets.chomp
  if !name.empty?
    puts "Cohort: "
    cohort = gets.chomp.downcase
    while !cohorts.include?(cohort)
      puts "Please enter a valid cohort: "
      cohort = gets.chomp.downcase
    end
    puts "Country of birth: "
    country_of_birth = gets.chomp
    if country_of_birth.empty?
      country_of_birth = "not supplied"
    end
    puts "Height: "
    height = gets.chomp
    if height.empty?
      height = "not supplied"
    end
    puts "Hobbies: "
    hobbies = gets.chomp
    if hobbies.empty?
      hobbies = "not supplied"
    end
  end
  # while name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      students << {name: name, cohort: cohort.to_sym, country_of_birth: country_of_birth, height: height, hobbies: hobbies}
        if students.count == 1
          puts "Now we have #{students.count} student"
        else
          puts "Now we have #{students.count} students"
        end
      # get another name from the user
      puts "Name: "
      name = gets.chomp
      if !name.empty?
        puts "Cohort: "
        cohort = gets.chomp.to_sym
        if cohort.empty?
          cohort = :november
        end
        puts "Country of birth: "
        country_of_birth = gets.chomp
        if country_of_birth.empty?
          country_of_birth = "not supplied"
        end
        puts "Height: "
        height = gets.chomp
        if height.empty?
          height = "not supplied"
        end
        puts "Hobbies: "
        hobbies = gets.chomp
        if hobbies.empty?
          hobbies = "not supplied"
        end
      end
    end
  # return the array of students
  students
end

def print_header
  puts "The students of Villain Academy".center(@line_width)
  puts "---------------".center(@line_width)
end

#def print(students)
#  counter = 0
#  until counter == students.length
#    student = students[counter]
#    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(@line_width)
#    puts "Country of birth: #{student[:country_of_birth]}".center(@line_width)
#    puts "Height: #{student[:height]}".center(@line_width)
#    puts "Hobbies include: #{student[:hobbies]}".center(@line_width)
#    counter += 1
#  end
#end

def print(students)
  sorted_by_cohort = students.sort_by { |hash| hash[:cohort] }
  sorted_by_cohort.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(@line_width)
    puts "Country of birth: #{student[:country_of_birth]}".center(@line_width)
    puts "Height: #{student[:height]}".center(@line_width)
    puts "Hobbies include: #{student[:hobbies]}".center(@line_width)
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student.".center(@line_width)
  else
    puts "Overall, we have #{students.count} great students".center(@line_width)
  end
end

def interactive_menu
  students = []
  loop do
    # print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # read the input
    selection = gets.chomp
    # do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu

# Nothing will happen until we call the methods
#if students.count > 0
#  print_header
#  print(students)
#  print_footer(students)
#end
