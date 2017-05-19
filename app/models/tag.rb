class Tag < ApplicationRecord
  belongs_to :category, optional: true
  mount_uploader :avatar, AvatarUploader
  has_many :yearly_scores do
    def total_count
      sum('yearly_scores.score')
    end

    def by_year(year)
      where(year: year).first.score
    end
  end

  def rank
    1 + category.scores.index { |elm| elm[:name] == self.name}
  end

  def current_year_rank
    1 + category.all_time_tags_scores.index {|elm| elm[:name] == self.name}
  end

  validates_uniqueness_of :name

end


