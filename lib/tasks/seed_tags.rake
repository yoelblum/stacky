require 'csv'

task :seed_tags => :environment do

  CSV.foreach(File.dirname(__FILE__)+ "/seeds/QueryResults.csv") do |row|
    # use row here...\
    tag = Tag.where(name: row[1]).first_or_create
    tag.yearly_scores << YearlyScore.new(year: row[0], score: row[2])
    tag.save!
  end
end

task seed_monthly: :environment do
  CSV.foreach(File.dirname(__FILE__) + "/seeds/monthly.csv") do |r|
    tag = Tag.where(name: r[1]).first
    MonthlyScore.create!(tag_id: tag.id, score: r[0], month: r[2])
  end
end