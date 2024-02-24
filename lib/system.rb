require_relative 'dependencies'

class System
  def initialize
    @cache = Cache.instance(100)
  end

  def run
    loop do
      puts "1. Add a new key"
      puts "2. Get value for a key"
      puts "3. Delete a key"
      puts "4. Exit"
      choice = gets.chomp
      puts choice
      case choice
      when "1"
        puts "Enter key and value"
        input = gets.chomp.split
        @cache.set(input[0], input[1])
      when "2"
        puts "Enter key"
        key = gets.chomp
        ans = @cache.get(key)
        puts "********************************************************************************"
        puts ans
        puts "********************************************************************************"
      when "3"
        puts "Enter key"
        key = gets.chomp
        @cache.get(key)
      when "4"
        break
      else
        puts "Enter a valid option"
      end
    end
  end
end