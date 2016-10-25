@students = []
@line_width = 80

def input_students
  puts "Please enter the name, cohort and additional information for each student"
  puts "To finish, just hit return twice"
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
  name = STDIN.gets.chomp
  if !name.empty?
    puts "Cohort: "
    cohort = STDIN.gets.chomp.downcase
    while !cohorts.include?(cohort)
      puts "Please enter a valid cohort: "
      cohort = STDIN.gets.chomp.downcase
    end
    puts "Country of birth: "
    country_of_birth = STDIN.gets.chomp
    if country_of_birth.empty?
      country_of_birth = "not supplied"
    end
    puts "Height: "
    height = STDIN.gets.chomp
    if height.empty?
      height = "not supplied"
    end
    puts "Hobbies: "
    hobbies = STDIN.gets.chomp
    if hobbies.empty?
      hobbies = "not supplied"
    end
  end
  # while name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      @students << {name: name, cohort: cohort.to_sym, country_of_birth: country_of_birth, height: height, hobbies: hobbies}
        if @students.count == 1
          puts "Now we have #{@students.count} student"
        else
          puts "Now we have #{@students.count} students"
        end
      # get another name from the user
      puts "Name: "
      name = STDIN.gets.chomp
      if !name.empty?
        puts "Cohort: "
        cohort = STDIN.gets.chomp.downcase
        while !cohorts.include?(cohort)
          puts "Please enter a valid cohort: "
          cohort = STDIN.gets.chomp.downcase
        end
        puts "Country of birth: "
        country_of_birth = STDIN.gets.chomp
        if country_of_birth.empty?
          country_of_birth = "not supplied"
        end
        puts "Height: "
        height = STDIN.gets.chomp
        if height.empty?
          height = "not supplied"
        end
        puts "Hobbies: "
        hobbies = STDIN.gets.chomp
        if hobbies.empty?
          hobbies = "not supplied"
        end
      end
    end
end

def print_header
  puts "The students of Villain Academy".center(@line_width)
  puts "---------------".center(@line_width)
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(@line_width)
    puts "Country of birth: #{student[:country_of_birth]}".center(@line_width)
    puts "Height: #{student[:height]}".center(@line_width)
    puts "Hobbies include: #{student[:hobbies]}".center(@line_width)
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student.".center(@line_width)
  else
    puts "Overall, we have #{@students.count} great students".center(@line_width)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country_of_birth], student[:height], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, country_of_birth, height, hobbies = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, country_of_birth: country_of_birth, height: height, hobbies: hobbies}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students

interactive_menu
