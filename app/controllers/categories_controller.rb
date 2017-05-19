class CategoriesController < ApplicationController
  def index

  end

  def show
    @category = Category.find(params['id'])
    @scores = @category.scores
    render '_category'
  end

end