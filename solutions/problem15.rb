w = h = 20

starts = []
for i in 1..h
  starts << { x: 0, y: i}
end
for i in 1..w
  starts << { x: i, y: h}
end

paths = {{ x: 0, y: 0}  => 1}
starts.each do |s|

  until s[:x] > w or s[:y] < 0
    paths[s] = 0

    unless s[:x] == 0
      paths[s] += paths[{ x: s[:x]-1, y: s[:y] }]
    end
    unless s[:y] == 0
      paths[s] += paths[{ x: s[:x], y: s[:y]-1 }]
    end

    s = { x: s[:x]+1, y: s[:y]-1 }
  end
  
end

puts paths[{ x: 20, y: 20 }]
