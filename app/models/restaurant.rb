class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy # ensure that reviews get deleted when restaurants are deleted
end
