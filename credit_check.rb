def valid?(card_number)
  if card_number.to_i == 0
    return false
  end

  sum_of_digits = 0

  # Read each digit from right to left
  digits = card_number.reverse.chars
  digits.each_with_index do |char, index|
    # Double every other digit
    if index.odd?
      char = (char.to_i * 2).to_s

      # If the doubled digit is over 9 then sum the individual digits of the doubled digit
      if char.to_i > 9
        char = (char[0].to_i + char[1].to_i).to_s
      end
    end

    # Sum each of the resulting digits
    sum_of_digits += char.to_i
  end

  # puts "sum_of_digits: #{sum_of_digits}"

  # Return valid only if the sum of the resulting digits % 10 equals 0
  sum_of_digits % 10 == 0
end
