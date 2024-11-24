def foobar(a, b)

  if a == 20
    puts b
  elsif b == 20
    puts a
  else 
    puts a + b
  end
end

puts foobar(20, 30)