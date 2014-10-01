ans = 0

1000.times do |n|
	if n % 3 == 0|| n % 5 == 0
		ans += n
	end
end

puts ans