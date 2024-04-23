require "pry-byebug"

def bubble_sort(array)
  array.length.times do 
    array.each do |number|
      current_element_index = array.index(number)
      next_element_index = array.index(number) + 1
  
      #prevents error when we reach the end of the array, because at that point
      #array.index(number + 1) would go beyond the length of the array and would 
      #return nil
      break if next_element_index > array.length - 1

      #handles the sorting
      if number > array[next_element_index]
        array[current_element_index] = array[next_element_index]
        array[next_element_index] = number
      end
    end
  end
  p array
end

bubble_sort([4,3,78,2,0,2])