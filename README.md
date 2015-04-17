ruby word_test.rb

rspec word_test_spec.rb

Outputs sequences for words in dictionary.txt file.

For example, given the trivial dictionary containing only

arrows
carrots
give
me

The outputs should be:

'sequences'             

carr                    
give                    
rots                    
rows                    
rrot                    
rrow                    

'words'

carrots
give
carrots
arrows
carrots
arrows

Of course, 'arro' does not appear in the output, since it is found in more than one word.