def merge_sort(arr)
  return arr if arr.length <= 1
  middle = arr.length / 2
  left = merge_sort(arr[0...middle])
  right = merge_sort(arr[middle..])
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

merge_sort([1, 2, 3, 4, 5, 6])
