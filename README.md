#Prime Generator


A small ruby program to generate and check for prime numbers with the algorithm sieve of erastothenes.

##Usage
  In your terminal:
      
    irb
    require './prime_generator'
      
  To generate prime numbers in an interval:
    
    PrimeGenerator.generate 2, 10
    #=> [3,5,7]
    
  To check a prime number:
  
    PrimeGenerator.is_prime? 5
    #=> true
    