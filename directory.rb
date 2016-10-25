@line_width = 80

def input_students
  puts "Please enter the name, cohort and additional information for each student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first names
  puts "Name: "
  name = gets.gsub(/\n/, "")
  if !name.empty?
    puts "Cohort: "
    cohort = gets.gsub(/\n/, "").to_sym
    if cohort.empty?
      cohort = :november
    end
    puts "Country of birth: "
    country_of_birth = gets.gsub(/\n/, "")
    if country_of_birth.empty?
      country_of_birth = "not supplied"
    end
    puts "Height: "
    height = gets.gsub(/\n/, "")
    if height.empty?
      height = "not supplied"
    end
    puts "Hobbies: "
    hobbies = gets.gsub(/\n/, "")
    if hobbies.empty?
      hobbies = "not supplied"
    end
  end
  # while name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      students << {name: name, cohort: cohort, country_of_birth: country_of_birth, height: height, hobbies: hobbies}
        if students.count == 1
          puts "Now we have #{students.count} student"
        else
          puts "Now we have #{students.count} students"
        end
      # get another name from the user
      puts "Name: "
      name = gets.gsub(/\n/, "")
      if !name.empty?
        puts "Cohort: "
        cohort = gets.gsub(/\n/, "").to_sym
        if cohort.empty?
          cohort = :november
        end
        puts "Country of birth: "
        country_of_birth = gets.gsub(/\n/, "")
        if country_of_birth.empty?
          country_of_birth = "not supplied"
        end
        puts "Height: "
        height = gets.gsub(/\n/, "")
        if height.empty?
          height = "not supplied"
        end
        puts "Hobbies: "
        hobbies = gets.gsub(/\n/, "")
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

def print(students)
    students.each.with_index(1) do |student, index|
       puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(@line_width)
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

students = input_students

# Nothing will happen until we call the methods
if students.count > 0
  print_header
  print(students)
  print_footer(students)
end
