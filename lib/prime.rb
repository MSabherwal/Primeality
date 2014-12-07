
module Primes

	def self.primes_table(n)
		prime_ary = self.find_primes(n)
		puts self.create_table(prime_ary,n)
	end

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

	def self.create_table(ary,n)
		
		table = ''
		#returns the size of the largest row (= largest_num + 2 space buffer)
		size = ary[-1].to_s.length+2
		#get total horizontal space of table, so header can cover
		tab_len = (size+2)*9

		table += "_"*tab_len+"\n\n"+"Primes up to #{n}".center(tab_len)+"\n"+"_"*tab_len+"\n\n"
		
		while ary.empty? == false
			row = '|'
			hold = ary.shift(10)
			hold.each do |int|
				# print each in in a cell, and concat str
				row += int.to_s.center(size)+"|"
			end
			table +=row+"\n"
		end
		return table
	end
end
