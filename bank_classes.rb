
class Customer
attr_accessor :name, :age, :location, :pin
# DO PIN IF IT WORKS
  def initialize(name, age, location, pin)
    @name = name
    @age = age
    @location = location
    @pin = pin
  end
end
  class Account
    attr_reader :account_number, :customer, :account_type, :balance

    def initialize(account_type, account_number , balance, customer)
      @account_number = account_number
      @customer = customer
      @account_type = account_type
      @balance = balance
    end

      def deposit(deposit_amount)
      @balance += deposit_amount
      end

      def withdrawl(withdrawl_amount)

        @balance -=  withdrawl_amount
      end
  end
