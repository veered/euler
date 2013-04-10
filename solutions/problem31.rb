coins = [1, 2, 5, 10, 20, 50, 100, 200]

def change(n, coins)
  return 0 if n < 0
  return 1 if n == 0
    
  ways = 0
  coins.each_with_index do |coin, i|
    ways += change(n - coin, coins[i..-1])
  end
  
  ways
end

puts change(200, coins)

