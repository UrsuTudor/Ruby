# ASYMPTOTIC NOTATIONS
  # notations used to describe the running time of an algorithm
  # types:
    # big O - the upper bound of an algorithm (the worst-case scenario for how the alg. will perform)
    # omega notation - the lower bound(best case)
    # theta notation - lower and upper bounds(average case complexity of the algo)

  # notations of notations: 
    # O(1) - constant complexity (number of steps remains the same)
    # O(log N) - logarithmic complexity (+ 1 step as the data doubles)
    # O(N) - linear complexity (+1 step per extra item)
    # O(N log N) - N x log N complexity 
      # logarhitmic + linear in one
      # think: merge sort
        # first splits an array => logarithmic
        # passes it to merge => linear
    # O(n²) - Quadratic Complexity (steps = items**2; a loop in a loop will cause this)
    # O(n³) - Cubic Complexity (steps = items**3; three nested loops)
    # O(2ⁿ) - Exponential Complexity (steps double with each item)
    # O(N!) - Factorial Complexity (steps is factorial of items; calculating permutations or combinations will cause this)
