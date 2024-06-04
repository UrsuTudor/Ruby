require './script'

describe '#caesar_cipher' do
  it 'encodes a string through caesar cipher' do
    expect(caesar_cipher('abc', 1)).to eql('bcd')
  end

  it 'encodes a string with special characters' do
    expect(caesar_cipher('ab! c?', 1)).to eql('bc! d?')
  end

  it 'encodes a string with numbers' do
    expect(caesar_cipher('a1b2c3', 1)).to eql('b1c2d3')
  end

  it 'respects letter case' do
    expect(caesar_cipher('aBcD', 1)).to eql('bCdE')
  end
end
