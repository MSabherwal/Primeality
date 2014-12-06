
module Primes

	def self.find_primes(n)
		# Input check for validity
		return [] if n <=1 

		#  create an array of n+1 values, all bool (n+1 to account for 0)
		#  set  index 0 & 1 = false
		ary = [false,false]+[true]*(n-1)
		
		# determine prime from 2 to sqrt(n)
		#  (Due to mirroring of multiples)
		(2..Math.sqrt(n).ceil).each do |int|
			#skip 0 and 1
			next if ary[int] == false
			
			#Assuming all previous multiple have been found, can start at
			# int**2
			(int**2..n).step(int).each do |x|
				ary[x] = false
			end
		end
		#aggregate results
		final = []
		ary.each.with_index do|val, index|
			final.push(index) if val == true
		end
		return final
	end
end

puts Primes.find_primes(150).inspect

puts Primes.find_primes(-10).inspect