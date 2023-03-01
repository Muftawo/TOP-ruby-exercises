def clean_zipcode(zipcode)
    zipcode.to_s.strip.rjust(5, "0")[0..4]
end


def clean_phone_number(homephone)

  # return bad numbers as 0s
  number = homephone.gsub(/[^0-9]/,'')
  len_num = number.length
  if len_num < 10 or len_num > 11
    number ="0000000000"
  elsif len_num == 11 and number["0"] != "1"
    number ="0000000000"
  elsif len_num ==11 and number["0"] != "1"
    number = number[1..len_num]
  else
    number
  end
  number[0..2]+'-'+number[3..5]+'-'+number[6..10]
end

