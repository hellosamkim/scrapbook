def translate(word)
  if /[aeiouy]/.match(word[0])
    word + "ay"
  elsif !/[aeiouy]/.match(word[0..1])
    word[2..-1] + word[0..1] + "ay"
  else
    word.reverse + "ay"
  end
end