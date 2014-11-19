# Pig Latin time!
#
# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
#
# Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.

require "pig_latin"

describe "#translate" do

  it "translates a word beginning with a vowel" do
    s = translate("apple")
    expect(s).to eq("appleay")
  end

  it "translates a word beginning with a consonant" do
    s = translate("banana")
    expect(s).to eq("ananabay")
  end

  it "translates a word beginning with two consonants" do
    s = translate("cherry")
    expect(s).to eq("errychay")
  end

  # it "translates two words" do
  #   s = translate("eat pie")
  #   expect(s).to eq("eatay iepay")
  # end

  # it "translates a word beginning with three consonants" do
  #   expect(translate("three")).to eq("eethray")
  # end

  # it "counts 'sch' as a single phoneme" do
  #   s = translate("school")
  #   expect(s).to eq("oolschay")
  # end

  # it "counts 'qu' as a single phoneme" do
  #   s = translate("quiet")
  #   expect(s).to eq("ietquay")
  # end

  # it "counts 'qu' as a consonant even when it's preceded by a consonant" do
  #   s = translate("square")
  #   expect(s).to eq("aresquay")
  # end

  # it "translates many words" do
  #   s = translate("the quick brown fox")
  #   expect(s).to eq("ethay ickquay ownbray oxfay")
  # end

  # Extra challenges:
  # Write tests and get them to pass for:
  # * capitalized words are still capitalized (but with a different initial capital letter, of course)
  # * the punctuation of the original phrase is retained

end
