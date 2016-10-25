@line_width = 80

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first names
  name = gets.chomp
  # while name is not empty, repeat this code
    while !name.empty? do
      # add the student hash to the array
      students << {name: name, cohort: :november}
        if students.count == 1
          puts "Now we have #{students.count} student"
        else
          puts "Now we have #{students.count} students"
        end
      # get another name from the user
      name = gets.chomp
    end
  # return the array of students
  students
end

def print_header
  puts "The students of Villain Academy".center(@line_width)
  puts "---------------".center(@line_width)
end

def print(students)
   puts "Below are students whose names are shorter than 12 characters:".center(@line_width)
    students.each.with_index(1) do |student, index|
     if student[:name].length < 12
       puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(@line_width)
     end
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
