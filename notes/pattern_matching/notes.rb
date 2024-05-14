# SYNTAX
  # basic: 
    # basic syntax uses case - in - when statements
    grade = 'C'

    case grade
    in 'A' then puts 'Amazing effort'
    in 'B' then puts 'Good work'
    in 'C' then puts 'Well done'
    in 'D' then puts 'Room for improvement'
    else puts 'See me'
    end

# PATTERNS
  # patterns can be:
    # a ruby object, matched using ===
      input = 3

      case input
      in String then puts 'input was of type String'
      in Integer then puts 'input was of type Integer'
      end

      # can be used to match:
      #   Booleans
      #   nil
      #   Numbers
      #   Strings
      #   Symbols
      #   Arrays
      #   Hashes
      #   Ranges
      #   Regular Expressions
      #   Procs

    # a variable pattern
      # assigns a variable to the values that match the pattern 
        a = 5

        case 1
        in a
          a
        end

        puts a
        # use ^a if you want to look for a pattern match instead of an assignment

    # an 'as' pattern
      # similar to variable pattern, but can be used in more compex assignments
        case 3
        in 3 => a
          puts a
        end

    # an alternative pattern
      # allows checking of multiple options
        case 0
        in 0 | 1 | 2
          puts :match
        end
    # a guard condition
      # using an if to make sure the pattern is only matched if the condition is true
        some_other_value = true

        case 0
        in 0 if some_other_value
          puts :match
        end

    # an array pattern
      arr = [1, 2, 3, 4, 5, 6, 7, 8, [9, 10]]

      case arr
      in [Integer, a, _, _, *tail, [9, b] => nested]
        puts a
        puts tail
        puts nested
      end
        # a will assign 2 to a
        # _ means it doesn't care about the match
        # *(splat) will ignore everything that comes after or before the values specified
        # tail saves what comes after *
        # nested arrays can be matched against
        # => can be used to store the nested array, so the example above matches against the array and the component b

    # a hash pattern
      # only works with symbol keys
      # can match against a part of a hash without being forced to use the *splat, like in arrays
        case { a: 'apple', b: 'banana', c: 'cat', d: 'dog', e: 'elephant' }
        in { a: 'aardvark', b: 'bat' }
          puts :no_match
        in { a: 'apple', b: b, c:, **rest }
          puts :match
          puts b # will return the value of key b
          puts c # will return the whole hash
          puts rest
        end

        # **rest will save the rest of the hashes 
        # **nil will ensure you look for an exact match
        # using the as pattern will save the entire hash if there is a match: 
          case { a: 'ant', b: 'ball' }
          in { a: 'ant' } => hash
            p hash
          end

    # experimental patterns:
      # a rightward assignment
        # uses => instead of =
          login = { username: 'hornby', password: 'iliketrains' }

          login => { username: username } # this is the equivalent of case {username: username} in login

          puts "Logged in with username #{username}"

      # a find pattern
        # allows matching with a part of an array
          # because the as pattern gets the whole array and the variable pattern only gets one element
        # uses a * on either side of the part you want to match
          case [1, 2, "a", 4, "b", "c", 7, 8, 9]
          in [*pre, String => x, String => z, *post]
            p pre
            p x
            p z
            p post
          end
          
          # => [1, 2, "a", 4]
          # => "b"
          # => "c"
          # => [7, 8, 9]

    # a combination of the above

# RETURN VALUES
  # returns last matching value
  # return NoMatchingPatternError if no match is found

# WHEN TO USE
  # use case/in when there are mutliple condtionals you could possibly match against 
  # use the rightward assignment when the data structure you are matching against is already known
