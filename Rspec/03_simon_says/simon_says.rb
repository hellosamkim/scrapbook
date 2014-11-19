def echo(word)
  word
end

def shout(word)
  word.upcase!
end

def repeat(word, time=2)
  sentence = []
  time.times do 
    sentence << word
  end
  sentence.join(" ")
end

def start_of_word(word,pos)
  word[0..(pos - 1)]
end

def first_word(sentence)
  sentence.split(" ")[0]
end

def titleize(sentence)
  little_words = ["and", "over", "the"]
  words = sentence.split(" ")
  words.each do |word|
    if little_words.include?(word)
      if word == words[0]
        word.capitalize!
      end
      word.downcase
    else
      word.capitalize!
    end
  end
  words.join(" ")
end