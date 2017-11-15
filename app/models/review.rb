class Review < ApplicationRecord
  belongs_to :restaurant
  validates :restaurant, presence: true
  validates :content, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than: 6 }
end

# class Player < ApplicationRecord
  # validates :points, numericality: true
  # validates :games_played, numericality: { only_integer: true }

# Validation
# A restaurant must have at least a name and an address.
# The restaurant category should belong to a fixed list ["chinese", "italian", "japanese", "french", "belgian"].
# A review must have a parent restaurant.
# A review must have content and a rating. The rating should be a number between 0 and 5.
# When a restaurant is destroyed, all of its reviews should be destroyed as well.
# Validate all model tests before moving to the routing layer. You can use this command:
