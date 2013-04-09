require 'csv'

CSV.foreach("db/articles.csv") do |row|
  record = []

  row.join(',').split('|').each do |cell|
    record << cell.strip    
  end
  
  record.pop if record[-1] == ""
  record[3] = record[3].split('/')[-1]
  record[3] = record[3].gsub(' ', '-')
  record[4] = "Sports" if record[4] == "sport"
  record[4] = "Computer world" if record[4] == "computer-world"

  category = Category.find_or_create_by_name(:name => record[4].downcase.capitalize)
  article = Article.create(:title => record[1].capitalize, :description => record[2], :url => record[3], :category_id => category.id)
  
  if record[5]
    tags = record[5].split(', ')

    tags.each do |tag|
      article.tags << Tag.find_or_create_by_name(:name => tag)
    end
  end
end

