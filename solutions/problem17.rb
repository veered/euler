$numbers = ['', 'one', 'two', 'three', 'four', 'five',
            'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
            'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen',
            'seventeen', 'eighteen', 'nineteen']

$tens = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty',
         'seventy', 'eighty', 'ninety']

def word_number(n)
  nstring = n.to_s
  first = nstring[-3].to_i
  second = nstring[-2].to_i
  third = nstring[-1].to_i
  
  if nstring.size == 1
    return $numbers[n]
  end

  if nstring.size == 2

    unless n < 20
      
      if third == 0
        return $tens[second]
      else
        return "#{$tens[second]}-#{word_number(third)}"
      end
      
    else
      return $numbers[n]
    end
    
  end

  if nstring.size == 3
    
    unless second == 0 and third == 0
      return "#{word_number(first)} hundred and #{word_number(second*10 + third)}"
    else
      return "#{word_number(first)} hundred"
    end
    
  end
  
end

for n in 20..999
  $numbers[n] = word_number(n)
end
$numbers[1000] = "one thousand"

clean = $numbers.map { |word| word.gsub(/[ -]/, '') }
count = clean.reduce(0) { |sum, word| sum + word.size }

puts count
