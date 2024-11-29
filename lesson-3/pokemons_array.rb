def counting_pokemons
  puts "How many pokemons do you want to add?"
  count = 0
  loop do 
    count = gets.to_i
  break
end

def setting_pokemons(count)
  pokemons_array = []
  
  count.times do
    puts "What`s his name?"
    name = gets.chomp
    puts "What`s his color?"
    color = gets.chomp
  
    pokemons_array << {name: , color: }
  end
  pokemons_array
end
  
def getting_pokemons(pokemons)
  puts "[#{pokemons.map {|pokemon| "{name: '#{pokemon[:name]}', color: '#{pokemon[:color]}' }" }.join(', ')}]"
end
  
  pokemons = setting_pokemons(count)
  getting_pokemons(pokemons)
end

counting_pokemons