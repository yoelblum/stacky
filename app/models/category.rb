class Category < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :tags do
    def top_by_total(limit = 15)
      self.map do |tag|
        {name: tag.name, score: tag.yearly_scores.total_count, id: tag.id, image_url: tag.image_url}
      end.sort_by {|e| e[:score]}.reverse.take(limit)
    end
  end

  def all_time_tags_scores
    self.tags.map do |tag|
      {name: tag.name, score: tag.yearly_scores.total_count, id: tag.id, image_url: tag.image_url}
    end
    .sort_by {|e| e[:score]}.reverse
  end


  def scores(limit = 15)
    self.tags.map do |tag|
      {name: tag.name, score: tag.yearly_scores.by_year(Date.today.year),
       alltime_score: tag.yearly_scores.total_count, id: tag.id, image_url: tag.avatar.url}
    end
    .sort_by {|e| e[:alltime_score] }.reverse.each_with_index{ |elm, index| elm[:alltime_rank] = index + 1}
    .sort_by {|e| e[:score]}.reverse.each_with_index{|elm, index| elm[:rank] = index + 1}
    .take(limit)
  end


  def top_with_years
    self.tags.map do |tag|
      {name: tag.name, yearly_scores: tag.yearly_scores}
    end
  end

end
