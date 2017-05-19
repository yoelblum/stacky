class MonthlyScore < ApplicationRecord
  validates_uniqueness_of :tag_id, scope: [:month, :year]
  belongs_to :tag
end