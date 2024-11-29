puts "Input your word:"

def getting_word(word)
  if "#{word}".end_with?('cs') || "#{word}".end_with?('CS')
    puts 2 ** "#{word}".length.to_i
  else
    puts "#{word}".reverse
  end
end

word = gets.chomp

getting_word(word)