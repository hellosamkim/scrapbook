sum = 0
fib1 = 1
fib2 = 2
fib3 = fib2

while fib3 < 4000000 do 
	if fib3 % 2 == 0
		sum += fib3
	end

	fib3 = fib1 + fib2
	fib1 = fib2
	fib2 = fib3
end

p sum