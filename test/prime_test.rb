gem 'minitest' #because otherwise minitest complains on my machine...
require 'minitest/autorun'
require File.expand_path("..", File.dirname(__FILE__))+"/lib/prime"
require 'prime'

class PrimesTest < Minitest::Test


	def test_that_primes_are_valid
		[-1,0,1,2,10,50,100].each do |n|
			assert_equal Prime.entries(n), Primes.find_primes(n)
		end
	end


end