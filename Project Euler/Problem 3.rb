require 'Prime'

num = 600851475143
num_sqrt = Math.sqrt(600851475143).round
primes = []

n = 2
while n <= num_sqrt do
	if num % n == 0 && Prime.prime?(n)
		primes << n 
	end
	n += 1
end

p primes.max