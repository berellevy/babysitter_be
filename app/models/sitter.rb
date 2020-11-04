class Sitter < ApplicationRecord
  has_many :references
  has_many :availabilities
end
