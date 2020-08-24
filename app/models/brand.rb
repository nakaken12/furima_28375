class Brand < ApplicationRecord
  has_many :items

  validates :b_name, uniqueness: { case_sensitive: true }
end
