

#load guess word

# show lives remaining, allow gor game to be saved
# save and quit game


puts "Hello welcome to hangman"
print "Would like to creat an account or play a trail game \n \npress A to create account and C to continue"
acc=gets.chomp



#get secrete word

words= File.open('words.txt')


#show board



