$ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(string, shift_factor = 0)
  string_to_array = string.split('')
  ciphered_string = []

  string_to_array.map do |character|
    cipher_character_index = $ALPHABET.index(character.downcase).to_i + shift_factor

    ciphered_string.push($ALPHABET[cipher_character_index])
  end

  p ciphered_string.join
end

caesar_cipher("What a string!", 5)