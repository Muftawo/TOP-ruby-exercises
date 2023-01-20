
# interesting that ruby doesn't have methods to check for lower and upper case
def caesar_cipher(message, shift)

    ans = ""
    message.each_char do |c|
        if /[[:upper:]]/.match(c) 
            ans+= ((c.ord - "A".ord + shift) % 26 + "A".ord ).chr   
        elsif /[[:lower:]]/.match(c)
            ans+= ((c.ord - "a".ord + shift)% 26 + "a".ord ).chr   
        else 
            ans+= c

        end 
    end 
    return ans
end


puts caesar_cipher("What a string!", 5)


