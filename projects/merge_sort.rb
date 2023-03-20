def merge_sort(arr)
  return arr if arr.size < 2

  merged = []

  left = arr.slice!(0, arr.length / 2)
  right = arr

  left_sort = merge_sort(left)
  right_sort = merge_sort(right)

  until left_sort.empty? || right_sort.empty?
    merged << if left_sort.first <= right_sort.first
                left_sort.shift
              else
                right_sort.shift
              end

  end
  merged + left_sort + right_sort
end


array1 = [0,1,2,3,4,6,5]
array2 = [6,5,2,1,0,3,4]
p merge_sort(array1)
p merge_sort(array2)
