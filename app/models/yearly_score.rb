class YearlyScore < ApplicationRecord
  belongs_to :tag
  validates_uniqueness_of :year, scope: :tag_id
end