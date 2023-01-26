
# using a sliding window

def stocker_picker stocks

    result = [0,1]
    left , right = 0, 1
    prev_sum , curr_sum = stocks[0],stocks[0]

    while right < stocks.length

        if stocks[right] <= stocks[right - 1]
            left = right 
            right += 1
            curr_sum = stocks[left]
        else 
            curr_sum += stocks[right]
            right = right + 1

        end

        if curr_sum > prev_sum

            prev_sum = curr_sum
            result = [left, right-1]
        end 


    end

    result

end

print stocker_picker([1,3,4,5,10,7])