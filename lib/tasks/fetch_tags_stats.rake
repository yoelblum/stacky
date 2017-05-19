task show_query: :environment do
  tags = Tag.where.not(category_id: nil).map{|tag| "'#{tag.name}'"}.join(",")
  sql = <<SQL
  SELECT COUNT(*), Tags.TagName,
         DATEPART(mm, CreationDate)
  FROM
  Posts
  INNER JOIN PostTags
  ON Posts.Id = PostTags.PostId
  INNER JOIN Tags
  ON Tags.Id = PostTags.TagId
  WHERE Tags.TagName IN (Select TagName From Tags WHERE
  TagName IN (#{tags})
  ) AND Posts.CreationDate >  '2017-01-01'
  GROUP BY Tags.TagName, DATEPART(mm, CreationDate)
  ORDER BY TagName,  DATEPART(mm, CreationDate)
  SQL

SQL
  puts sql
end