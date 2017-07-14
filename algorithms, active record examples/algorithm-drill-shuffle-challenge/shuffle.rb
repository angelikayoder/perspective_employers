def shuffle(array)
  randomized_array = Array.new
  n = 0
  while n < array.length
   another_array = rand(array.length)
   if randomized_array.include?(another_array)
      else
      randomized_array.push(another_array)
      n += 1
    end
  end
  yet_another_array = Array.new(array.length)
  i = 0
  while i < array.length
    yet_another_array[randomized_array[i].to_i] = array[i]
    i += 1
  end
  yet_another_array
end
