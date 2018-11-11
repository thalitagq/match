class Cliente < ApplicationRecord
  belongs_to :advogado, index: { unique: true }
end
