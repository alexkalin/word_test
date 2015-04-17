require File.expand_path("word_test.rb")

describe WordTest do
  let(:word_test) { WordTest.new }


  before do
    allow(File).to receive(:open).and_return(StringIO.new("abc\ngive\nword\nhelping\nhelping\ntractor\ntree"))
  end

  describe "dictionary" do
    subject { word_test.dictionary }

    it { is_expected.to be_an Array }
    it { is_expected.to include "abc" }
    it { is_expected.to include "give" }
    it { is_expected.to include "word" }
    it { is_expected.to include "helping" }
    it { is_expected.not_to include "abbe" }
  end

  describe "words" do
    subject { word_test.words } 

    it { is_expected.to be_an Array }
    it { is_expected.not_to include "abc" }
    it { is_expected.to include "give" }
    it { is_expected.to include "word" }
    it { is_expected.to include "helping" }
    it { is_expected.not_to include "abbe" }
  end

  describe "sequences" do
    subject { word_test.sequences }

    it { is_expected.to be_a Hash }
    it { is_expected.not_to include abc: ["abc"] }
    it { is_expected.to include give: ["give"] }
    it { is_expected.to include word: ["word"] }
    it { is_expected.to include trac: ["tractor"] }
    it { is_expected.not_to include help: ["helping"] }
  end

  describe "find_sequences" do
    let(:word) { "helping"}

    subject { word_test.find_sequences(word) }
    
    it { is_expected.to be_an Array }
    it { is_expected.to include "help" }
    it { is_expected.to include "ping" }
    it { is_expected.to include "elpi" }
  end

  describe "generate" do
    subject { word_test.generate }

    before do
      allow(File).to receive(:open).with("words.txt", "w")
      allow(File).to receive(:open).with("sequences.txt", "w")
    end
  end

end