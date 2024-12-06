BALANCE_PATH = './text/balance.txt'
DEFAULT_BALANCE = 100.0

#BALANCE
def get_balance
 if File.exist?(BALANCE_PATH)
   File.open(BALANCE_PATH, 'r') do |balance_in_file|
     balance = balance_in_file.readline
     return balance
   end
 else
   balance.puts DEFAULT_BALANCE
   end
end

def show_balance
  balance = get_balance
  puts "Your current balance is: #{'%.1f' % balance}"
end

#DEPOSIT:
def checking_balance_file
  unless File.exist?(BALANCE_PATH)
    File.open(BALANCE_PATH, 'w') { |file| file.write(DEFAULT_BALANCE) }
  end
end

def current_balance
  checking_balance_file
  File.read(BALANCE_PATH).to_f
end

def update_balance(new_balance)
  File.write(BALANCE_PATH, new_balance.to_f)
end

def deposit
  puts "How much money would you like to deposit? "
  amount = gets.chomp.to_f

  if amount > 0
    new_balance = current_balance + amount
    update_balance(new_balance)
    puts "Your balance is : #{new_balance}"
  else
    puts "This sum is invalid, please try again.\n"
    puts "HINT: Your sum must be greater than 0."
    return deposit
  end
end

#WITHDRAW
def update_the_balance(new_balance)
  File.open(BALANCE_PATH, 'w') { |file| file.write(new_balance) }
end

def withdraw
  unless File.exist?(BALANCE_PATH)
    File.open(BALANCE_PATH, 'w') { |file| file.write(DEFAULT_BALANCE) }
  end

  current_balance = File.read(BALANCE_PATH).to_f
  puts "Current balance: #{'%.1f'% current_balance}"

  puts "How much money would you like to withdraw? "
  amount = gets.chomp.to_f

  if amount <= 0
    puts "Withdrawal amount must be greater than 0."
    return withdraw
  elsif amount > current_balance
    puts "You cannot withdraw more than your current balance of #{'%.1f'% current_balance}."
    return withdraw
  else
    new_balance = current_balance - amount
    update_the_balance(new_balance)
    puts "Withdrawal successful! Your current balance is: #{ '%.1f' % new_balance}."
  end
end


#QUIT
def handle_commands
  balance = get_balance

  loop do
    puts "Do you really want to quit? (y/n)"
    input = gets.chomp

    case input
    when 'y'
      quit(balance)
    when 'n'
      return start_program
    else
      puts "Invalid command. Please use 'n' to stay with us, or 'y' to quit."
      return handle_commands
    end
  end
end

def quit(balance)
  update_the_balance(balance)
  puts "Your balance is #{balance}\n"
  puts "Thank you for using our bank!"
  exit
end

def start_program
  puts "-----------WELCOME--TO--YOUR--BANK--ACCOUNT-----------"

  puts "What would you like to do:\n"

  puts "To deposit the money, please press D or d\n"
  puts "To withdraw the money, please press W or w\n"
  puts "To see the balance, please press B or b\n"
  puts "To quit, please press Q or q\n"

  userchoice = gets.chomp
  if userchoice == 'D' || userchoice == 'd'
    deposit
  elsif userchoice == 'W' || userchoice == 'w'
    withdraw
  elsif userchoice == 'B' || userchoice == 'b'
    show_balance
  elsif userchoice == 'Q' || userchoice == 'q'
    handle_commands
  end
  return start_program
end

start_program