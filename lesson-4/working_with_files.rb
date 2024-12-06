SOFTWARE_ENGINEERS_LIST_PATH = './text/software_engineers.txt'
BUFFER = './text/buffer.txt'

def index
  if File.exist?(SOFTWARE_ENGINEERS_LIST_PATH)
    File.readlines(SOFTWARE_ENGINEERS_LIST_PATH).each_with_index do |engineer, id|
      puts "#{id + 1}: #{engineer.strip}"
    end
  end
end

def find(id)
  id = id.to_i - 1
  engineers = File.readlines(SOFTWARE_ENGINEERS_LIST_PATH)

  if engineers[id]
    puts engineers[id].strip
  else
    puts "No engineers found with this id"
  end
end

def where(pattern)
  match_pattern = []

    File.readlines(SOFTWARE_ENGINEERS_LIST_PATH).each do |engineer|
      if engineer.include?(pattern)
        match_pattern << engineer.strip
      end
    end

    if match_pattern.empty?
      puts "There`s no pattern like this"
    else
      match_pattern.each { |match| puts match }
    end
end

def update(id, text)
  id = id.to_i - 1
  file = File.open(BUFFER, 'w')
  File.foreach(SOFTWARE_ENGINEERS_LIST_PATH).with_index do |softwareengineer, index|
    file.puts(id == index ? text : softwareengineer)
  end

  file.close
  File.write(SOFTWARE_ENGINEERS_LIST_PATH, File.read(BUFFER))
  puts "Software Engineer №#{id} was successfully updated to #{text}"
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  id = id.to_i - 1
  engineers = File.readlines(SOFTWARE_ENGINEERS_LIST_PATH)
  if engineers[id]
    engineers.delete_at(id)
    File.write(SOFTWARE_ENGINEERS_LIST_PATH, engineers.join)
    puts "Software Engineer was deleted"
  else
    puts "No id found"
  end
end

def create(name)
  File.open(SOFTWARE_ENGINEERS_LIST_PATH, 'a'.strip) do |software_engineers|
    software_engineers.puts(name)
  end
  puts "New line with name #{name} successfully created"
end


index()
find(4)
where("n")
update(4, "Mark Zuckerberg")
delete(4)
create("Mark Zuckerberg")