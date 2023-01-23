


def substrings(sentence, dictionary)

    result = Hash.new
    
    dictionary.each do |word|

        c = sentence.downcase.scan(word).length
        result[word] = c if c > 0

    end

    result
    
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("Below low", dictionary)