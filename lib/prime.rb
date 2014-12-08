
module Primes



	#erathosthenes yields primes up to era_max = 1e5 using a modified sieve of Erathosthenes 
	def self.erathosthenes()

		return enum_for(:erathosthenes) unless block_given?

		#picked arbitrarily large value to find primes with..
		era_max = 1e5.to_i #constant time


		#  create an array of 1e5+1 values, all bool (+1 to account for 0)
		#  set  index 0 & 1 = false
		ary = [nil,nil]+[true]*(era_max-1) #constant time
		
		# determine prime from 2 to sqrt(n)
		#  (Due to mirroring of multiples)
		(2..era_max).each do |int| #time n
			#skip if false (don't think this will occur, just being safe)
			next if ary[int] == nil
			
			
			#Assuming all previous multiple have been found, can start at
			# int**2. RUNTIME : http://en.wikipedia.org/wiki/Divergence_of_the_sum_of_the_reciprocals_of_the_primes
							#  implies the sum of primes is loglogn
			(int**2..era_max).step(int).each do |x|
				ary[x] = nil
			end
			yield int
		end
		
	end

	# THe run time of erathosthenes is n*loglogn

	class PrimeMultiplicationTable
		def initialize(config)
			opts = {
				:header_column => 10,
				:header_row    => 10,
			}.merge(config)

			@header_row     = Primes.erathosthenes.take(opts[:header_row])    #tells the # of columns
			@header_column  = Primes.erathosthenes.take(opts[:header_column]) #tells the # of rows

			@table = @header_column.reduce([]){|table,col|
				table.push( @header_row.map{|row| col*row})
			}

			#cell width will be vertically aligned, so that each column is uniform, each row is dynamic
			@cell_width = @table.transpose.reduce([]) {|cw,row|
				cw << row.max.to_s.length+2 #add 2 for space between '|' and int
			}
		end

		attr_reader :table, :header_row, :header_column, :cell_width

		def to_s
			top = header
			return table.reduce(header) { |output,row|
				output += table_row(row,true)+"\n"
			}
		end

		private

		# table_row returns the string representation of the row given
		def table_row(row,blank_first)
			str = ( blank_first ? (row[0]/2).to_s.center(3) : "   ")+"|"
			row.each_with_index { |int,index|
				str+= int.to_s.center(@cell_width[index])+'|'
			}
			return str
		end



		def header
			table_width = @cell_width.reduce{|tw,val|
				tw+=val+2
			}
			blocks = '_'*table_width
			mid_blocks = '-'*table_width
			return blocks+ "\n\n" +"#{@header_column.length} x #{@header_row.length} Prime Multiplication Table".center(table_width+3)+"\n"+table_row(@header_row,false)+"\n"+mid_blocks+"\n"
		end

	end
end

