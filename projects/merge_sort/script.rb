require 'pry-byebug'

def merge_sort(arr)
  return arr if arr.length <= 1

  middle = arr.length / 2
  left = merge_sort(arr[0...middle])
  right = merge_sort(arr[middle..])

  merge(left, right)
end

def merge(left, right)
  sorted = []

  until left.empty? || right.empty?
    if left.first < right.first
      sorted.push(left.shift)
    elsif right.first < left.first
      sorted.push(right.shift)
    end
  end

  p sorted.concat(left).concat(right)
end

merge_sort([2, 1, 3, 6, 4, 5])
