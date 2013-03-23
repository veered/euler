puts (1..100).to_a.reduce(:+)**2 - (1..100).to_a.map{|n| n**2}.reduce(:+)
