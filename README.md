Objective

Write a program that prints out a multiplication table of the first 10 prime numbers.

The program must run from the command line and print one table to STDOUT.

The first row and column of the table should have the 10 primes, with
each cell containing the product of the primes for the corresponding row and
column.

Notes

• Consider complexity. How fast does your code run? How does it scale?

• Consider cases where we want N primes.

• Do not use the Prime class from stdlib (write your own code).

• Write tests. Try to demonstrate TDD/BDD.

When you’re done, Put your code on GitHub or email us a zip/tarball.

-----------------------------------------------------------------------------------------

Determining performance: 
* The speed of the prime finding methodology is O(n *loglogn), which can be explained thus:
	- Assume n is the value we are iterating up to (in the base example, that would be 10)
	- The creation of an array size n to be using in the algorithim is assumed to take
		constant time
	- In order to find all primes up to an integer, you would normally iterate up to n**.5,
		as the multiples mirror after, however as the use case isn't to find all up to n but
		to obtain some x unique primes, we will iterate all the way to n, creating a loop of time n
	- The algorithm has us go from y^2 (where y is an int in range 2..n) to n via multiples of y,
		meaning:
			n/2 + n/3 +n/5 + n/7 ...
			which is a divergent prime series, which as been solved by euler to take:
				log log n time
	-as all other operation take constant time, the dominant factor is the n *log log n factor,

	therefore the system takes O(n* log log n)

* The speed of graphing is dominated by the multiplication of the rows and columns, which take
	polynomial time, or x*y, which means polynomial time ( O(n**2) ) 

------------------------------------------------------------------------------------------------
Running the script

$ruby prime_table.rb
	Comman line options :
		-h --help   Shows all the command line options
		-r --rows   Number of rows
		-c --col    Number of columns
