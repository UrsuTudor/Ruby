# ruby arrays accept negative indexes too
#.first & .last get the respective elements
# array.first(2) return a new array with the first two elements

#ADDING and REMOVING ELEMENTS
  # .push - adds element at the end
  # <<

  # .pop - removes element at the end
  # .delete() - removes all instances of element; an array can be an argument
  # .delete_at() - removes element at index
  
  # .unshift - adds element at start
  # .shift - removes element at start 

  #pop and shift can also take integer arguments and remove multiple elements

#ADDING AND SUBTRACTING ARRAYS
  # arr a + arr b => array ab
  # arr.concat(arr b) => array ab
  # same with subtracting (-)

#METHODS
  # .empty?
  # .size - return lenght
  # .reverse
  # .include 
  # .join
  # .split - makes an array out of a string
  # .flatten - if you have multiple arrays in an array, joins nested arrays together 
  # .index() - returns index of element
  # .sample - returns a random element of the array
  # .take() - return specified number of elements from the array, without changing the array
  # .concat() - adds arrays

  # .map || .collect do the same thing
  # .select - .filter in JS
  # .uniq - returns array with unique elements
  # .sort 
  # .product - returns an array of arrays that are a combination of all elements from all arrays

#LOOPING
  # each_index - allows manipulation of index and returns index of looped items 
  # each_with_index - allows manipulation of index and value 