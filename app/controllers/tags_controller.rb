class TagsController < ApplicationController
  def index

  end

  def show
    @tag = Tag.includes(:yearly_scores).find(params['id'])
    @yearly_scores = (@tag.yearly_scores.sort_by { |y| y.year}).to_json
    @rank = @tag.rank
    @current_year_rank = @tag.current_year_rank
    @category_tags = @tag.category.top_with_years.reject {|ys| ys[:name] == @tag.name}
  end
end