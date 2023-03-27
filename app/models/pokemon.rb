# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord
    TYPES = [
        'fire',
        'electric',
        'normal',
        'ghost',
        'psychic',
        'water',
        'bug',
        'dragon',
        'grass',
        'fighting',
        'ice',
        'flying',
        'poison',
        'ground',
        'rock',
        'steel'
      ].sort.freeze

    validates :image_url, presence: true
    validates :captured, inclusion: {in: [true, false], message: "must be 'true' or 'false'"}
    validates :name, uniqueness: { message: "name: '%{value}' is already taken" }, length: { in: 3..255 }
    validates :attack, :defense, numericality: { greater_than_or_equal_to: 0, less_than: 101 }
    validates :number, numericality: {in: 1..200}
    validates :poke_type, inclusion: { in: TYPES, message: "'%{value}' is not valid" }

    has_many :items,
      dependent: :destroy

    has_many :poke_moves,
      dependent: :destroy

    has_many :moves,
      through: :poke_moves,
      source: :move


end
