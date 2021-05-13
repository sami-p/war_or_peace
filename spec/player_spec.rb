require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  describe '#initialize' do
    it 'exists' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])

      player = Player.new('Clarisa', deck)

      expect(player).to be_an_instance_of(Player)
    end

    it 'has a name' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])

      player = Player.new('Clarisa', deck)

      expect(player.name).to eq("Clarisa")
    end

    it 'has a deck' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])

      player = Player.new('Clarisa', deck)

      expect(player.deck).to eq(deck)
    end

    it 'defaults #has_lost? to false' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])

      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to eq(false)
    end

    it 'can tell when a player #has_lost' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      deck = Deck.new([card1, card2, card3])

      player = Player.new('Clarisa', deck)

      player.deck.remove_card
      expect(player.deck.cards).to eq([card2, card3])
      expect(player.has_lost?).to eq(false)


      player.deck.remove_card
      expect(player.deck.cards).to eq([card3])
      expect(player.has_lost?).to eq(false)

      player.deck.remove_card
      expect(player.deck.cards).to eq([])
      expect(player.has_lost?).to eq(true)
    end
  end
end
