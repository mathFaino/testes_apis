class Feirante < ApplicationRecord
  validates :nome, presence: true
  validates :cpf, presence: true
end
