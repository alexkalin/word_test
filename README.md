ruby word_test.rb
rspec word_test_spec.rb

Outputs sequences for words in dictionary.txt file.

For example, given the trivial dictionary containing only

arrows
carrots
give
me

The outputs should be:

'sequences'             'words'

carr                    carrots
give                    give
rots                    carrots
rows                    arrows
rrot                    carrots
rrow                    arrows

Of course, 'arro' does not appear in the output, since it is found in more than one word.