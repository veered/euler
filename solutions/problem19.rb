count = 0
for year in 1..100
  for month in 1..12
    t = Time.new(1900 + year, month, 1)
    count += 1 if t.sunday?
  end
end

puts count
