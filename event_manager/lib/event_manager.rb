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


def peak(sample_hash)
  sample_hash.max_by{|k,v| v}[0]
end

def get_day_and_hour(date_string)
  return DateTime.strptime(date_string,"%m/%d/%y %H:%M").wday, DateTime.strptime(date_string,"%m/%d/%y %H:%M").hour
end


def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    legislators = civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    )
    legislators = legislators.officials
    legislator_names = legislators.map(&:name)
    legislator_names.join(", ")
  rescue
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end


  homephone = clean_phone_number(row[:homephone])

  day, hour = get_day_and_hour(row[:regdate])
  hours[hour] = hours.dig(hour).to_i + 1
  weekdays[day] = weekdays.dig(day).to_i + 1
  

p_day = peak(weekdays)
p_hour = peak(hours)

days_of_week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday" , "Saturday"]
puts "\nThe day with the highest number of registrations #{days_of_week[p_day]} \n \nThe hour in which most people register is #{p_hour}:00 "


