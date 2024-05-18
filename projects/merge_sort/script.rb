def merge_sort(arr)
  if arr.length > 1
    sliced_arr = arr.each_slice((arr.length / 2.0).round).to_a
    left_side = sliced_arr[0]
    right_side = sliced_arr[1]

    merge_sort(left_side)
    merge_sort(right_side)
  end
end
