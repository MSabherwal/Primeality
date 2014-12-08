#!/usr/bin/env ruby

require 'optparse'
require './lib/prime'

clo = {
	    :header_column => 10,
	    :header_row    => 10
	}
	

OptionParser.new do |opts|
    opts.banner = "Usage: prime_table.rb [options]"
    opts.on('-c', "--col [number of columns]", Integer,'number of columns in table') do |v|
        clo[:header_row] = v
    end

    opts.on('-r', "--row [number of rows]", Integer,'number of rows in table') do |v|
        clo[:header_column] = v
    end

end.parse!(ARGV)

puts Primes::PrimeMultiplicationTable.new(clo).to_s