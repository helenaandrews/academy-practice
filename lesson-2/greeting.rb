def greeting()
    puts "What's your name?"
    name = gets.to_s
    puts "What's your surname?"
    surname = gets.to_s
    puts "How old are you?"
    age = gets.to_i
    
    if age < 18 
        print "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    else 
        print "Привет, #{name} #{surname}. Самое время заняться делом!"
    end   
end

puts greeting