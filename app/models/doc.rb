class Doc < ApplicationRecord
  belongs_to :client

  validates :number, presence: true
  validates :description, presence: true
  validates :price, presence: true

end
