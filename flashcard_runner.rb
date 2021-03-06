require_relative 'flashcards'
require_relative 'guess'
require_relative 'deck'
require_relative 'round'
require_relative 'card_generator'
require 'pry'
card_1 = Card.new("Who hosted Hollywood Squares between 1986 and 1989?", "John Davidson")
card_2 = Card.new("A group of lions is called a what?", "Pride")
card_3 = Card.new("When was the Apple II computer introduced?", "1977")
card_4 = Card.new("What author created the character of Tom Bombadil?", "J.R.R. Tolkien")
card_5 = Card.new("Which bird lays the largest eggs?", "Ostrich")
card_6 = Card.new("What archaeological site is known as the Lost City of the Incas?", "Machu Picchu")
card_7 = Card.new("What is the only country which borders the Black Sea and the Caspian Sea?", "Russia")
card_8 = Card.new("What is most likely to occur when your diaphragm goes into spasms?", "Hiccups")
card_9 = Card.new("Who did Abraham Lincoln replace as president?", "James Buchanan")
card_10 = Card.new("Gangster Al Capone was eventually arrested and convicted on what charge?", "Tax evasion")

#TO DO: Incorporate Card Generator here:
# new_deck = Deck.new([card_2, card_3, card_6, card_8, card_10])
new_deck = Deck.new(CardGenerator.new("trivia_questions.txt").cards)
# binding.pry
new_round = Round.new(new_deck)


def start(round)
  puts "Welcome! You're playing with #{round.guesses.count + round.deck.cards.count} cards."
  puts "-------------------------------------"
  until round.deck.cards.empty?
  puts "This is card number #{round.guesses.count + 1} out of #{round.guesses.count + round.deck.cards.count}."
  print "Question: #{round.current_card.question} "
  input = gets.chomp.capitalize
  round.record_guess(input)
  end
  puts "****** Game over! ******"
  puts "You had #{round.number_correct} correct guesses out of #{round.guesses.count} for a score of #{round.percent_correct}."
end

start(new_round)
