STUDENTS_PATH = './text/students.txt'
RESULT_PATH = './text/results.txt'

def show_file_content
  if File.exist?(STUDENTS_PATH)
    File.readlines(STUDENTS_PATH).each_with_index do |student|
      puts "#{student.strip}"
    end
  end
end

def reading_the_file
  File.read(STUDENTS_PATH).split("\n")
end

def writing_in_the_file(matching_students)
  File.open(RESULT_PATH, 'a') do |file|
    matching_students.each { |student| file.puts(student) }
  end
end

def searching_the_age
  rewritten_students = Set.new(File.read(RESULT_PATH).split("\n"))
  students = reading_the_file

  loop do
    puts 'Input the age, please (or type "s" to see the list of students in results):'
    input = STDIN.gets.chomp

    if input == 's'
      show_the_results_file
      break
    elsif students_age = input.to_i
      matching_students = students.select do |student|
        student.include?(students_age.to_s) && !rewritten_students.include?(student)
      end
    else
      puts "Incorrect command, try again"
      return searching_the_age
    end

    if matching_students.empty?
      puts "No students found with age #{students_age}."
    else
      puts "Found #{matching_students.size} student with age:"
      matching_students.each { |student| puts student }
      writing_in_the_file(matching_students)
      rewritten_students.merge(matching_students)
    end

    if rewritten_students.size == students.size
      puts "All students have been copied to results"
      break
    end
  end
  show_the_results_file
end

def show_the_results_file
  students = File.readlines(STUDENTS_PATH).map(&:chomp)
  results = File.readlines(RESULT_PATH).map(&:chomp)

  if results.size == students.size
    puts "Rewritten students:"
    results.each { |line| puts line }
  else
    puts "Not all students have been rewritten"
    puts "If you want to see the results anyway, please enter -1"
    puts "If you want to quit, please press 'q'"

    input = gets.chomp

    case input
    when '-1'
      results.each { |line| puts line }
      exit
    when 'q'
      exit
    else
      puts "This input is incorrect."
      return show_the_results_file
    end
  end
end

show_file_content
searching_the_age