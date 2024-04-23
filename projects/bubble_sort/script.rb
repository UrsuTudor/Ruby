require "pry-byebug"

def bubble_sort(array)
  sort_iterations = 0 
  array.length.times do 
    #counter that allows the stopping of the function if no 
    #more shifts were needed
    shifts_on_iteration = 0

    array.each do |number|
      current_element_index = array.index(number)
      next_element_index = array.index(number) + 1
  
      #prevents error at the end of the array
      break if next_element_index > array.length - 1
      #breaks if the next element is one that was already pushed to the end by the sort
      break if next_element_index == array.length - sort_iterations
      #handles the sorting
      if number > array[next_element_index]
        array[current_element_index] = array[next_element_index]
        array[next_element_index] = number
        shifts_on_iteration += 1
      end
    end
    sort_iterations += 1
    break if shifts_on_iteration == 0
  end
  return array
end

bubble_sort([4,3,78,2,0,2])