# Description
These are two methods that print a fibonacci sequence of the specified length. One of them uses iteration, the other uses recursion.

## How they work:

### Iterative method:
Using fibs_length as a parameter, it initiates a fibs_sequence array with the values [0, 1]. 
The next step is subtracting 2 from fibs_length (for two elements already in the sequence) and starting a fibs_length.times loop.
The loop pushes the sum of the last two elements of the sequence into the sequence.
Once the loop is done, the sequence is printed.

### Recursive method:
It uses the same fibs_length as a parameter and a fibs_sequence parameter that is initialized at [0, 1] by default.
The method works by pushing the sum of the last two elements of the sequence into the sequence and recalling itself with the new sequence.
The method returns and prints the sequence when the length of the sequence matches the length specified by the user.
