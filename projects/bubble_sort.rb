

def bubble_sort list

    for  i in 0..list.length
        swapped = false

        for j in 0..list.length - i -2
            if list[j] > list[j + 1]

                list[j],list[j + 1] = list[j+1],list[j]

                swapped = true

            end
        end
        if not swapped
            puts "stopped at #{i+1}"
            break 
        end


    end

    return list

end

arr = [1,2,155,3,4,5]
# puts arr[4]
print bubble_sort(arr)
