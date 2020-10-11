require 'open-uri'
require 'nokogiri'

namespace :scrape do
  namespace :system do 

    def system_scrape(url, level, starts_at, ends_at, part)
      puts "実行"
      wordbook = Wordbook.find_by!(name: "システム英単語")
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
      doc = Nokogiri::HTML.parse(html, nil, charset)
      doc.css(".table.sys tr.phrase").each_with_index do |el,i|
        i += 1
        if i >= starts_at
          if el.css(".en .red").length == 2
            english = "#{el.css(".en .red")[0].text} #{el.css(".en .red")[1].text}"
          else
            english = el.css(".en .red").text 
          end 
          if el.css(".red.jp").length >= 2
            japanese = el.css(".red.jp")[0].text
          else
            japanese = el.css(".red.jp").text
          end 
          puts i
          puts english
          puts japanese
          # Word.create({
          #   english: english,
          #   japanese: japanese,
          #   part: part,
          #   level: level,
          #   wordbook_id: wordbook.id
          # })
          puts "---------------------------"
          break if i >= ends_at
        end
      end
    end

    namespace :basicStage do
      url = "https://kina-ko.appspot.com/study/systan/1" 
      level = "Basic Stage"
      task verbs: :environment do 
        part = "動詞"
        system_scrape(url, level, 0, 240, part)
      end

      task nouns: :environment do 
        part = "名詞"
        system_scrape(url, level, 241, 457, part)
      end

      task adjectives: :environment do 
        part = "形容詞"
        system_scrape(url, level, 458, 514, part)
      end

      task adverbs: :environment do 
        part = "副詞"
        system_scrape(url, level, 515, 526, part)
      end

      task adjectives2: :environment do 
        part = "形容詞"
        system_scrape(url, level, 527, 582, part)
      end

      task adverbs2: :environment do 
        part = "副詞"
        system_scrape(url, level, 583, 600, part)
      end
    end

    namespace :EssentialStage do
      url = "https://kina-ko.appspot.com/study/systan/2" 
      level = "Essential Stage"
      minus = 600
      task verbs: :environment do 
        part = "動詞"
        starts_at = 601 - minus
        ends_at = 773 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task nouns: :environment do 
        part = "名詞"
        starts_at = 774 - minus
        ends_at = 1052 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task adjectives: :environment do 
        part = "形容詞"
        starts_at = 1053 - minus
        ends_at = 1101 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task adverbs: :environment do 
        part = "副詞"
        starts_at = 1102 - minus
        ends_at = 1110 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task adjectives2: :environment do 
        part = "形容詞"
        starts_at = 1111 - minus
        ends_at = 1191 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task adverbs2: :environment do 
        part = "副詞"
        starts_at = 1192 - minus
        ends_at = 1200 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end
    end

    namespace :AdvancedStage do
      url = "https://kina-ko.appspot.com/study/systan/3" 
      level = "Advanced Stage"
      minus = 1200
      task verbs: :environment do 
        part = "動詞"
        starts_at = 1201 - minus
        ends_at = 1377 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task nouns: :environment do 
        part = "名詞"
        starts_at = 1378 - minus
        ends_at = 1581 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task adjectives: :environment do 
        part = "形容詞"
        starts_at = 1582 - minus
        ends_at = 1676 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task adverbs: :environment do 
        part = "副詞"
        starts_at = 1677 - minus
        ends_at = 1685 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end
    end

    namespace :FinalStage do
      url = "https://kina-ko.appspot.com/study/systan/4" 
      level = "Final Stage"
      minus = 1685
      task verbs: :environment do 
        part = "動詞"
        starts_at = 1686 - minus
        ends_at = 1774 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task nouns: :environment do 
        part = "名詞"
        starts_at = 1775 - minus
        ends_at = 1930 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task adjectives: :environment do 
        part = "形容詞"
        starts_at = 1931 - minus
        ends_at = 2016 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end

      task adverbs: :environment do 
        part = "副詞"
        starts_at = 2017 - minus
        ends_at = 2021 - minus
        system_scrape(url, level, starts_at, ends_at, part)
      end
    end

    task all: %i(
      basicStage:verbs
      basicStage:nouns
      basicStage:adjectives
      basicStage:adverbs
      basicStage:adjectives2
      basicStage:adverbs2
      EssentialStage:verbs
      EssentialStage:nouns
      EssentialStage:adjectives
      EssentialStage:adverbs
      EssentialStage:adjectives2
      EssentialStage:adverbs2
      AdvancedStage:verbs
      AdvancedStage:nouns
      AdvancedStage:adjectives
      AdvancedStage:adverbs
      FinalStage:verbs
      FinalStage:nouns
      FinalStage:adjectives
      FinalStage:adverbs
    )
  end

end

# Word.create({
#   english: "super_word#{i}",
#   japanese: "発展単語#{i}",
#   part: "名詞",
#   level: "発展",
#   wordbook_id: 4
# })