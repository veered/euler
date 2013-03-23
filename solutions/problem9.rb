squares = (1..1000).to_a.map{ |n| n**2 }
for a in 0..999
  for b in 0..(a-1)
    c = squares.index(squares[a] + squares[b])
    if (!c.nil? && a + b + c == 997)
      puts (a+1)*(b+1)*(c+1)
      exit
    end
  end
end
