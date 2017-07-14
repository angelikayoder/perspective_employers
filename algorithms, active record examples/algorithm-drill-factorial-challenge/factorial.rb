def factorial_iterative(n)
    result = 1
   while n > 0
     result = n * result
     n -= 1
   end
   result
end

def factorial_recursive(n)
    if n == 0
      return 1
    end
  n * factorial_recursive(n - 1)
end
