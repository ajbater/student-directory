require 'csv'

@students = []
@cohorts = [
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
@name =
@cohort =


#def add_student_info
#  @students << {name: @name, cohort: @cohort.to_sym}
#end

def input_students
  puts "Please enter the name and cohort for each student"
  puts "To finish, just hit return twice"
  # get the first names
  puts "Name: "
  @name = STDIN.gets.chomp
  if !@name.empty?
    puts "Cohort: "
    @cohort = STDIN.gets.chomp.downcase
    while !@cohorts.include?(@cohort)
      puts "Please enter a valid cohort: "
      @cohort = STDIN.gets.chomp.downcase
    end
  end
    # while name is not empty, repeat this code
    while !@name.empty? do
      # add the student hash to the array
      @students << {name: @name, cohort: @cohort}
        if @students.count == 1
          puts "Now we have #{@students.count} student"
        else
          puts "Now we have #{@students.count} students"
        end
      # get another name from the user
      puts "Name: "
      @name = STDIN.gets.chomp
      if !@name.empty?
        puts "Cohort: "
        @cohort = STDIN.gets.chomp.downcase
        while !@cohorts.include?(@cohort)
          puts "Please enter a valid cohort: "
          @cohort = STDIN.gets.chomp.downcase
        end
      end
    end
end

def print_header
  puts "The students of Villain Academy"
  puts "---------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student."
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
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
      puts "You selected: 1. Input the students"
      input_students
    when "2"
      puts "You selected: 2. Show the students"
      show_students
    when "3"
      puts "You selected: 3. Save the student list to students.csv"
      save_students
    when "4"
      puts "You selected: 4. Load the student list from students.csv"
      load_students
    when "9"
      puts "See you next time"
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

#def not_exist
#  puts "Sorry, that file does not exist."
#end

#def save_students
#    puts "Which file would you like to save to? "
#    save_to = STDIN.gets.chomp
#    while !File.exist?(save_to)
#      not_exist
#      puts "Try again: "
#      save_to = STDIN.gets.chomp
#    end
#    File.open(save_to, "w") { |file|
#      (
#      @students.each do |student|
#          student_data = [student[:name], student[:cohort], student[:country_of_birth], student[:height], student[:hobbies]]
#          csv_line = student_data.join(",")
#          file.puts csv_line
#        end
#      )
#    }
#end

def save_students
  CSV.open("students.csv", "w") do |csv|
    @students.each do |student|
      #student_data = [student[:name], student[:cohort]]
      #csv_line = student_data.join(",")
      #csv << csv_line
      csv << [student[:name], student[:cohort]]
    end
  end
end

#def user_selects_load_students
#  puts "File to load students from: "
#  filename = STDIN.gets.chomp
#  while !File.exist?(filename)
#    not_exist
#    puts "Try again: "
#    filename = STDIN.gets.chomp
#  end
#  load_students(filename)
#  puts "Loaded #{@students.count} from #{filename}"
#end

#def load_students
#   file = File.open("students.csv", "r")
#   file.readlines.each do |line|
#     name, cohort, country_of_birth, height, hobbies = line.chomp.split(',')
#     @students << {name: name, cohort: cohort.to_sym, country_of_birth: country_of_birth, height: height, hobbies: hobbies}
#   end
#   file.close
#end

 def load_students
   CSV.foreach("students.csv") do |row|
     @name, @cohort = row[0], row[1]
     @students << {name: @name, cohort: @cohort.to_sym}
   end
 end

def try_load_students
  filename = ARGV.first # first argument from command line
  if filename.nil? # get out of the method if it isn't given
    filename = "students.csv"
  elsif !File.exist?(filename) # if it doesn't exist
    not_exist
    exit
  end
    load_students
    puts "Loaded #{@students.count} from #{filename}"
end

try_load_students

interactive_menu
