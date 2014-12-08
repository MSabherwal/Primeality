gem 'minitest' #because otherwise minitest complains on my machine...
require 'minitest/autorun'
require File.expand_path("..", File.dirname(__FILE__))+"/lib/prime"
require 'prime'

class ErathosthenesTest < Minitest::Test


	def test_that_primes_are_valid
		[0,1,2,10,50,100].each do |n|
			assert_equal Prime.take(n), Primes.erathosthenes.take(n)
		end
	end

end

class PrimeMultiplicationTableTest < Minitest::Test
	def setup
		@PMT_normal = Primes::PrimeMultiplicationTable.new({})
		
		@PMT_greater_rows = Primes::PrimeMultiplicationTable.new({:header_column => 15})
		@PMT_less_rows = Primes::PrimeMultiplicationTable.new({:header_column => 5})
		
		@PMT_less_columns = Primes::PrimeMultiplicationTable.new({:header_row => 5})
		@PMT_greater_columns = Primes::PrimeMultiplicationTable.new({:header_row => 15})
	end

	def test_that_primes_table_array_is_correct
		assert_equal @PMT_normal.table, create_table_array(10,10)

		assert_equal @PMT_greater_rows.table, create_table_array(10,15)

		assert_equal @PMT_less_rows.table, create_table_array(10,5)

		assert_equal @PMT_less_columns.table, create_table_array(5,10)

		assert_equal @PMT_greater_columns.table, create_table_array(15,10)

	end

	def create_table_array(header_row_size, header_column_size)
		row    = Prime.take(header_row_size) #again, equals to top_row, or each value associates to a column
		column = Prime.take(header_column_size) #each associates to a row
		# multiply each row across a column to get a row in the table
		return column.reduce([]){|table,col|
				table.push( row.map{|r| col*r})
			}
	end
end