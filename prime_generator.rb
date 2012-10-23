class PrimeGenerator
  class << self
    
    def generate(from=2, to)
      from, to = compose_range_values(from, to)
      primes = (2..to).to_a
      range = (from..to).to_a      
      range & sieve_of_erastothenes(to)
    end

    def is_prime?(number)
      sieve_of_erastothenes(number).last == number
    end    
    
    private

    def compose_range_values(first, second)
      check_number_validity(first, second)
      return first < second ? [first, second] : [second, first]
    end

    def check_number_validity(*numbers)
      numbers.each{ |n| raise ArgumentError, "#{n} should be a positive integer bigger than 1." unless n > 1 && n.is_a?(Integer) }
    end

    def sieve_of_erastothenes(to)
      primes = Array.new(2)
      primes += (2..to).to_a
      
      primes.each do |number|
        next unless number
        break if number**2 > to
        (number**2).step(to, number){|index| primes[index]=nil}
      end
      primes
    end
  end
  
end