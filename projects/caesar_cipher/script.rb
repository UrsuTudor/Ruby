$ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(string, shift_factor = 0)
  string_to_array = string.split('')
  ciphered_string = []

  string_to_array.map do |character|

    next ciphered_string.push(character) if $ALPHABET.include?(character.downcase) == false

    cipher_character_index = $ALPHABET.index(character.downcase).to_i + shift_factor
    if cipher_character_index > 25 # indexes are from 0-25
      cipher_character_index = cipher_character_index - 26
    end

    next ciphered_string.push($ALPHABET[cipher_character_index].upcase) if character == character.upcase
    ciphered_string.push($ALPHABET[cipher_character_index])
  end

  p ciphered_string.join
end

caesar_cipher("What a string!", 5)