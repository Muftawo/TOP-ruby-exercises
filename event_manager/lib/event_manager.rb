def clean_zipcode(zipcode)
    zipcode.to_s.strip.rjust(5, "0")[0..4]
end

