class Artist < ApplicationRecord
  has_many :songs, dependent: :nullify

  validates :name, presence: true, uniqueness: true

  scope :default_order, ->{ order('name') }
end
