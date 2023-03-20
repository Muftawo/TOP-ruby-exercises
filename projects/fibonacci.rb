
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



