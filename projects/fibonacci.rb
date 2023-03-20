
def fib_iteration(val)
  i=1
  fib_a = 0
  fib_b = 1

  result  = [fib_a, fib_b]

  while i < val-1

    fib_c = fib_a + fib_b
    fib_a, fib_b = fib_b , fib_c

    i+=1
    result << fib_c
  end
  result

end



def fibs_rec(n)
  # base cases 0 and 1
  return [0] if n == 0
  return [0, 1] if n == 1

  array = fibs_rec(n - 1)
  # add the last two to form new elements
  array << array[-2] + array[-1]
end


p fib_rec(8)
p fib_iteration(8)
