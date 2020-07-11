class Artist < ApplicationRecord
  has_many :songs, dependent: :nullify

  validates :name, presence: true, uniqueness: true

  default_scope { order('name') }
end
