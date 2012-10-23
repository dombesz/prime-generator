require 'test/unit'
require './prime_generator'

class PrimeGeneratorTest < Test::Unit::TestCase

  def test_it_has_prime_method
    assert PrimeGenerator.respond_to?(:is_prime?), "doesnt have is_prime? method."
  end

  def test_it_has_a_generate_method
    assert PrimeGenerator.respond_to?(:generate), "doesnt have generate method."
  end

  def test_generate_method_takes_two_params_and_returns_array
    assert PrimeGenerator.generate(2, 5).is_a?(Array), "should return an array."
  end

  def test_should_raise_invalid_argument_error
    assert_raise(ArgumentError, "2.1 should be a positive integer bigger than 1."){ PrimeGenerator.generate(2.1, 5) }
    assert_raise(ArgumentError, "5.1 should be a positive integer bigger than 1."){ PrimeGenerator.generate(2, 5.1) }
    assert_raise(ArgumentError, "1 should be a positive integer bigger than 1.")  { PrimeGenerator.generate(1, 5) }
    assert_raise(ArgumentError, "0 should be a positive integer bigger than 1.")  { PrimeGenerator.generate(0, 1) }
    assert_raise(ArgumentError, "1 should be a positive integer bigger than 1."){ PrimeGenerator.generate(1) }
    assert_raise(ArgumentError, "-1 should be a positive integer bigger than 1."){ PrimeGenerator.generate(-1) }
  end
  
  def test_generate_should_work_with_one_param_too
    assert PrimeGenerator.generate(10).is_a?(Array)
  end
  
  def test_return_primes_up_to_a_number
    assert_equal PrimeGenerator.generate(10), [2,3,5,7]
  end
  
  def test_return_primes_in_interval
    assert_equal PrimeGenerator.generate(5,10), [5,7]
  end

  def test_return_primes_in_inverse_interval
    assert_equal PrimeGenerator.generate(10, 2), [2,3,5,7]
  end  
  
  def test_return_correct_primes_in_range
    assert_equal PrimeGenerator.generate(7900, 7920), [7901, 7907, 7919]
  end
  
  def test_is_prime_should_not_raise_on_invalid_argument
    assert_nothing_raised(ArgumentError){ PrimeGenerator.is_prime?(2.4)}
    assert_nothing_raised(ArgumentError){ PrimeGenerator.is_prime?(1)}
  end
  
  def test_is_prime_with_primes
    [2 ,3 ,5 ,7 ,11].each do |number|
      assert PrimeGenerator.is_prime?(number)
    end  
  end

  def test_is_prime_with_non_primes
    [0, 1, 4, 6, 8, 9, 10].each do |number|
      assert !PrimeGenerator.is_prime?(number)
    end  
  end

end