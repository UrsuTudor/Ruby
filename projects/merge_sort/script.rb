def merge_sort(arr)
  return arr if arr.length <= 1
  middle = arr.length / 2
  left = merge_sort(arr[0...middle])
  right = merge_sort(arr[middle..])
end

merge_sort([1, 2, 3, 4, 5, 6])
