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
    validates :attack, :defense, :poke_type, :image_url, null: false 
    validates :captured, inclusion: [true, false]
    validates :name, null: false, uniqueness: { message: "name: '%{value}' is already taken" }, length: { in: 3..255 }
    validates :number, null: false, uniqueness: { message: ""}


end
