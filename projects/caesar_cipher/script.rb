$ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(string, shift_factor = 0)
  string_to_array = string.split('')
  ciphered_string = []

  string_to_array.map do |character|

    next ciphered_string.push(character) if $ALPHABET.include?(character.downcase) == false

    cipher_character_index = $ALPHABET.index(character.downcase).to_i + shift_factor

    next ciphered_string.push($ALPHABET[cipher_character_index].upcase) if character == character.upcase
    ciphered_string.push($ALPHABET[cipher_character_index])
  end

  p ciphered_string.join
end

caesar_cipher("Bhat a string!", 5)