FactoryBot.define do
  
  factory :piece do
    @piece = Piece.create(x_position:1, y_position: 1)
  end

  factory :bishop do 
  end

  factory :king do 
  end

  factory :knight do
  end

  factory :pawn do 
  end

  factory :queen do 
  end

  factory :rook do
    @rook = Rook.create(x_position: 3, y_position: 8)
  end
end
