for x in 0..Float::INFINITY
  start = 10 ** x
  stop = start + x.times.reduce(0) { |a| a*10 + 6 }
  for y in start..stop
    nums = (1..6).map do |a|
      (a * y).to_s.chars.sort
    end
    if nums.all? { |a| a == nums[0] }
      puts y
      exit
    end
  end
end