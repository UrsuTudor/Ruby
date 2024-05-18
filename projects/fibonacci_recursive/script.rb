def fibs(fibs_length)
  # handles an input of 1 or 2
  return p fibs_sequence = [0] if fibs_length == 1
  return p fibs_sequence = [0, 1] if fibs_length == 2

  fibs_sequence = [0, 1]

  # because the first two elements are known by default
  fibs_length -= 2
  fibs_length.times do
    fibs_sequence.push(fibs_sequence[-2] + fibs_sequence[-1])
  end
  p fibs_sequence
end

fibs(8)
#=>[0, 1, 1, 2, 3, 5, 8, 13]

def fibs_rec(fibs_length, fibs_sequence = [0, 1])
  # final case
  return p fibs_sequence if fibs_sequence.length == fibs_length

  # handles an input of 1 or 2
  return p fibs_sequence = [0] if fibs_length == 1
  return p fibs_sequence if fibs_length == 2

  fibs_sequence.push(fibs_sequence[-2] + fibs_sequence[-1])
  fibs_rec(fibs_length, fibs_sequence)
end

fibs_rec(10)
#=>[0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
