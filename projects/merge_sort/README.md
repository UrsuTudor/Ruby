# Description
This is a merge_sort algorhitm built in Ruby as part of The Odin Project Ruby curriculum.

## How is works:

- Taking an array as an argument, it first checks for the base case, returning the array if it only contains one element.
- If the array contains more than one element, it splits it in two equal parts (as much as it is possible) by finding the middle index and using it in two different ranges, one for the left side and one for the right side.
- The range is used to call merge_sort on each of the sides until a value is returned, at which point the function moves on to calling merge with both sides (note that this will not be the left side of the original array, but the left side of the left side of the left side...see the example below).
- Taking the left and right sides as arguments, the merge function compares the first element of each side and pushes it into a sorted array, repeating this process until one of the arrays is empty.
- One of the arrays being empty means that all of its elements had a lower value than the current unshifted first element of the other side, so it is safe to exit the loop and simply #concat the other side to the sorted array.

