@line_width = 80

def input_students
  puts "Please enter the names of the student followed by their cohort"
  puts "Keep adding students and cohorts until you have entered them all"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first names
  puts "Name: "
  name = gets.chomp
  puts "Cohort: "
  cohort = gets.chomp.to_sym
  if cohort.empty?
    cohort = :november
  end
  # while name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      students << {name: name, cohort: cohort}
        if students.count == 1
          puts "Now we have #{students.count} student"
        else
          puts "Now we have #{students.count} students"
        end
      # get another name from the user
      puts "Name: "
      name = gets.chomp
      puts "Cohort: "
      cohort = gets.chomp.to_sym
      if cohort.empty?
        cohort = :november
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
    end
  end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student."
  else
    puts "Overall, we have #{students.count} great students".center(@line_width)
  end
end

students = input_students

# Nothing will happen until we call the methods
print_header
print(students)
print_footer(students)
