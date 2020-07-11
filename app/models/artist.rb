class Artist < ApplicationRecord
  has_many :songs, dependent: :nullify

  validates :name, presence: true
  validates :name, uniqueness: true

  default_scope { order('name') }
end
