class Book
  def title=(book_titles)
    conjunctions = ["and", "in", "the", "of", "a", "an"]
    book_title = book_titles.split(" ")
    book_title.each do |title_words| 
      if !conjunctions.include?(title_words) || book_title.index(title_words) == 0
        title_words.capitalize!
      else
        title_words
      end
    end
    book_title = book_title.join(" ")
    @title = book_title
  end

  def title
    @title
  end
end

