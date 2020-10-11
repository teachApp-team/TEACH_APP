require 'open-uri'
require 'nokogiri'

namespace :scrape do
  namespace :target do 
    task verbs: :environment do 
      url = "https://kina-ko.appspot.com/study/systan/1"
      charset = nil
      
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
      
      doc = Nokogiri::HTML.parse(html, nil, charset)
      doc.css("span.red.jp").each do |el|
        puts el.text
        break if el.text == "を生み出す"
      end
    end
  end

  task system: :environment do
  end
end

# Word.create({
#   english: "super_word#{i}",
#   japanese: "発展単語#{i}",
#   part: "名詞",
#   level: "発展",
#   wordbook_id: 4
# })