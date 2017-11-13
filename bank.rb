require_relative("bank_classes")

puts "Welcome to Nick's Bank!"
sleep(1)

def menu
  puts "- NICK'S BANK MAIN MENU -"
  puts "What are you here for?"
  puts "1: Sign up for an account?"
  puts "2: Sign in to your account?"
  choice = gets.chomp.to_i

  case choice
    when 1
      system("clear")
      sign_up
    when 2
      system("clear")
      sign_in
    else
      system("clear")
      puts "try again"
      menu
    end
end

@profile = []

def sign_up


  puts "What is you name?"
  name = gets.chomp
  puts "How old are you?"
  age = gets.chomp.to_i
  if age < 18
    puts "Must be 18 or older to open an account. Sorry."
    menu
  else
    puts "What's your location?"
    location = gets.chomp
    puts "Create a 4 digit pin"
    pin = gets.chomp.to_i

    @person_info = Customer.new(name, age, location, pin)
    @profile.push(@person_info)
  end
  account_creation
end

@account = []

  def account_creation



    puts "Do you want to open a 'CHECKING' or 'SAVINGS' account?"
    account_type = gets.chomp.upcase
    account_number = srand 12
    puts "How much do you want to deposit initially?"
    balance = gets.chomp.to_f
      if balance < 25
        puts "You must deposit at least $25 to continue"
      else
        puts "Thank you for your deposit of $ #{balance}"
        @account_info = Account.new(account_type, account_number, balance, @person_info)
        @account.push(@account_info)
      end
      menu
  end

    def sign_in
      puts "Enter your PIN"
      pin = gets.chomp.to_i
      if @profile.length == 0
        puts "You need to create an account"
        menu
      else
      # end
      # pinmatch =0
      # @profile.each do | index |
      #
      #   if pin == index.pin
      #       pinmatch = pinmatch +1
      # end
      #
      # if pinmatch ==1
      review_account
      # elsif pinmatch >1
      #   puts "please enter your name"
      #   puts "We need addition info"
      end

    end

    def review_account
      puts "What do you want to do?"
      puts "1. Check balance"
      puts "2. Deposit amount"
      puts "3. Withdrawl amount"
      puts "4. Review account info"
      puts "5. Sign out"

      choice = gets.chomp.to_i

      case choice
      when 1
        system("clear")
        puts "$#{@account_info.balance}"
        review_account
      when 2
        system("clear")
        puts "How much do you want to deposit?"
        deposit_amount = gets.chomp.to_f

        puts "Your new balance is $#{@account_info.deposit(deposit_amount)}"
        review_account
      when 3
        system("clear")
        puts "How much do you want to withdrawl?"
        withdrawl_amount =  gets.chomp.to_f
        puts "Your new balance is $#{@account_info.withdrawl(withdrawl_amount)}"
        review_account
      when 4
        system("clear")
        puts "#{@person_info.name}"
        puts "#{@person_info.age}"
        puts "#{@person_info.location} branch"
        puts "#{@account_info.account_type}"
        puts "Account Number: #{@account_info.account_number}"
        review_account
      when 5
        system("clear")
        puts "Thanks for visiting the bank!"
        sleep(2)
        system("clear")
        menu
      end
    end
menu
