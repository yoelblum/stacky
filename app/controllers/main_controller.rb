class MainController < ApplicationController
  def index
    @categories = Category.where(name: ['programming-languages', 'full-stack-web-frameworks', 'front-end-web-frameworks'])
    @category = Category.third
    @scores = @category.scores
  end
end