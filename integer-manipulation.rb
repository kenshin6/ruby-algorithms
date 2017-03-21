# Returns the first n digits of a number and rounds the rest down to zero. Works great with the rails helper method :number_to_human.
# Uses: For shortening user points from 3999999 to 3990000 so that you can shorten to 3.99M without giving them an extra 10K they don't actually have.

def first_3_digits_round_down(num, n)
  num.to_s.chars.map.with_index{ |c, i| n > 2 ? "0" : c }.join.to_i
end

# first_3_digits_round_down(16897654, 4) returns 16890000
