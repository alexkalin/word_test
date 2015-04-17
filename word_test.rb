class WordTest

  # This method opens the dictionary file.
  #
  # @return [Array]
  def dictionary
    @dictionary = File.open('dictionary.txt').readlines.map(&:chomp)
  end

  # This method gets all words greater than 3 characters.
  #
  # @return [Array]
  def words
    @words ||= dictionary.select { |word| word.length > 3 }
  end

  # This method generates all the possible sequences.
  #
  # @return [Hash]
  def sequences
    return @sequences if @sequences

    sequences = {}
    words.each do |word|
      find_sequences(word).each do |sequence|
        (sequences[sequence.to_sym] ||= []) << word
      end
    end

    @sequences = sequences.select do |sequence,words|
      words.count == 1
    end
  end

  # This method finds the possible character sequences.
  #
  # @return [Array]
  def find_sequences(word)
    word.scan(/./).each_cons(4).collect(&:join).uniq
  end

  # This method writes the sequences and words to files.
  #
  # @return [File]
  def generate
    word_file = File.open('words.txt', 'w')
    sequences_file = File.open('sequences.txt', 'w')

    sequences.each do |sequence,words|
      words.each do |word|
        word_file.puts(word)
        sequences_file.puts(sequence)
      end
    end

    word_file.close
    sequences_file.close
  end
end

WordTest.new.generate