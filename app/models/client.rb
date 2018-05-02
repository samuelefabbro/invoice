class Client < ApplicationRecord

    has_many :docs, dependent: :destroy

    validates :name, presence: true
    validates :info, presence: true

end
