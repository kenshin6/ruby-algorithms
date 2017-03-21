# Returns the first 3 digits of a number, with the rest rounded down to zero. Works great with the rails helper method :number_to_human
# Uses: For shortening user points from 3999999 to 3990000 so that you can shorten to 3.99M without giving them an extra 10K of points in the round 

def first_3_digits_round_down(num)
  num.to_s.chars.map.with_index{ |n, i| i > 2 ? "0" : n}.join.to_i
end  
