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
          Word.create({
            english: english,
            japanese: japanese,
            part: part,
            level: level,
            wordbook_id: wordbook.id
          })
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

  task oldjapanese: :environment do
    url = "https://tokyo-teacher.com/article/dj-32-jpc/dj-jpc-1-word/dj-jpc-word-1-list/"
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end
    doc = Nokogiri::HTML.parse(html, nil, charset)
    nodes = doc.xpath("//div[@class='topic-text']")
    
    nodes.each do |node|
      # このノード以下のすべての子要素に対して検索を行う場合は「.//」をつける
      title_node = node.xpath(".//p[contains(text(), '単語')]")
      array = []
      title_node.children.each_with_index do |w,i|
        if  w.text.include?('【単語】：')
          array[i] = [w.text.slice!(7..25)]
          # puts w.text
          puts w.text.slice!(7..25)
          # puts i
        elsif  w.text.include?('【漢字】：')
          array[i - 2].push(w.text.slice!(7..25))
          # puts w.text
          # puts w.text.slice!(7..25)
          # puts i
        elsif  w.text.include?('【意味】：')
          array[i - 4].push(w.text.slice!(7..25))
          # puts w.text
          # puts w.text.slice!(7..25)
          # puts i
        elsif  w.text.include?('【品詞】：')
          array[i - 6].push(w.text.slice!(7..25))
          # puts w.text
          # puts w.text.slice!(7..25)
          # puts i
          # puts '-----------------------------------------------'
        end
      end
      array.each do |a|
        next if a == nil
        word = a[0]  
        kannji = a[1]    
        mean = a[2]
        type = a[3]
        # OldWord.create({
        #     name: word,
        #     meaning: mean,
        #     kanji: kannji,
        #     part: type,
        #     old_wordbook_id: 1
        #   })
      end
    end


  end



  namespace :target do
    url = "https://gogen-ejd.info/%E3%82%BF%E3%83%BC%E3%82%B2%E3%83%83%E3%83%881900-%E7%AC%AC5%E8%A8%82%E7%89%88%E4%B8%80%E8%A6%A7/"
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end
    doc = Nokogiri::HTML.parse(html, nil, charset)
    task level100: :environment do 
      w = Wordbook.find_by(name: 'ターゲット1900')
      puts w.id
      doc.css('ol > li').each_with_index do |el, i|
        if i >= 0 && i < 40
          puts "#{i}番目は動詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "0000→0100",
                wordbook_id: w.id
              })
        elsif i  >= 40 && i < 76
          puts "#{i}番目は名詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "0000→0100",
                wordbook_id: w.id
              })
        elsif i >= 76 && i < 95
          puts "#{i}番目は形容詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "0000→0100",
                wordbook_id: w.id
              })
        elsif i >=95 && i < 100
          puts "#{i}番目は副詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "副詞",
                level: "0000→0100",
                wordbook_id: w.id
              })
        end
      end
    end
    task level200: :environment do 
      w = Wordbook.find_by(name: 'ターゲット1900')
      puts w.id
      doc.css('ol > li').each_with_index do |el, i|
        if i >= 100 && i < 140
          puts "#{i}番目は動詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "0100→0200",
                wordbook_id: w.id
              })
        elsif i  >= 140 && i < 178
          puts "#{i}番目は名詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "0100→0200",
                wordbook_id: w.id
              })
        elsif i >= 178 && i < 194
          puts "#{i}番目は形容詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "0100→0200",
                wordbook_id: w.id
              })
        elsif i >= 194 && i < 200
          puts "#{i}番目は副詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "副詞",
                level: "0100→0200",
                wordbook_id: w.id
              })
        end
      end
    end
    task level300: :environment do 
      w = Wordbook.find_by(name: 'ターゲット1900')
      puts w.id
      doc.css('ol > li').each_with_index do |el, i|
        if i >= 200 && i < 238
          puts "#{i}番目は動詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "0200→0300",
                wordbook_id: w.id
              })
        elsif i  >= 238 && i < 278
          puts "#{i}番目は名詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "0200→0300",
                wordbook_id: w.id
              })
        elsif i >= 278 && i < 294
          puts "#{i}番目は形容詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "0200→0300",
                wordbook_id: w.id
              })
        elsif i >= 294 && i < 300
          puts "#{i}番目は副詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "副詞",
                level: "0200→0300",
                wordbook_id: w.id
              })
        end
      end
    end
    task level400: :environment do 
      w = Wordbook.find_by(name: 'ターゲット1900')
      puts w.id
      doc.css('ol > li').each_with_index do |el, i|
        if i >= 300 && i < 340
          puts "#{i}番目は動詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "0300→0400",
                wordbook_id: w.id
              })
        elsif i  >= 340 && i < 378
          puts "#{i}番目は名詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
            english: el.css('a:first-child').text,
            japanese: el.children[1].text[1..-2],
            part: "名詞",
            level: "0300→0400",
            wordbook_id: w.id
          })
        elsif i >= 378 && i < 394
          puts "#{i}番目は形容詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
            english: el.css('a:first-child').text,
            japanese: el.children[1].text[1..-2],
            part: "形容詞",
            level: "0300→0400",
            wordbook_id: w.id
          })
        elsif i >= 394 && i < 400
          puts "#{i}番目は副詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
            english: el.css('a:first-child').text,
            japanese: el.children[1].text[1..-2],
            part: "副詞",
            level: "0300→0400",
            wordbook_id: w.id
          })
        end
      end
    end

    task level400_1500: :environment do 
      w = Wordbook.find_by(name: 'ターゲット1900')
      puts w.id
      doc.css('ol > li').each_with_index do |el, i|
        if i >= 400 && i < 1500
          n = i % 100
          if n >= 0 && n < 41
            if i / 100 == 4
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "0400→0500",
                wordbook_id: w.id
              })
            elsif i / 100 ==5
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "0500→0600",
                wordbook_id: w.id
              })
            elsif i / 100 ==6
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "0600→0700",
                wordbook_id: w.id
              })
            elsif i / 100 == 7
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "0700→0800",
                wordbook_id: w.id
              })
            elsif i / 100 == 8
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "0800→0900",
                wordbook_id: w.id
              })
            elsif i / 100 == 9
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "0900→1000",
                wordbook_id: w.id
              })
            elsif i / 100 == 10
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "1000→1100",
                wordbook_id: w.id
              })
            elsif i / 100 == 11
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "1100→1200",
                wordbook_id: w.id
              })
            elsif i / 100 == 12
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "1200→1300",
                wordbook_id: w.id
              })
            elsif i / 100 == 13
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "1300→1400",
                wordbook_id: w.id
              })
            elsif i / 100 == 14
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "1400→1500",
                wordbook_id: w.id
              })
            end


          elsif n >= 41 && n < 78
            puts "#{i}番目は名詞"
            puts el.css('a:first-child').text
            puts el.children[1].text[1..-2]

            if i / 100 == 4
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "0400→0500",
                wordbook_id: w.id
              })
            elsif i / 100 ==5
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "0500→0600",
                wordbook_id: w.id
              })
            elsif i / 100 ==6
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "0600→0700",
                wordbook_id: w.id
              })
            elsif i / 100 == 7
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "0700→0800",
                wordbook_id: w.id
              })
            elsif i / 100 == 8
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "0800→0900",
                wordbook_id: w.id
              })
            elsif i / 100 == 9
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "0900→1000",
                wordbook_id: w.id
              })
            elsif i / 100 == 10
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "1000→1100",
                wordbook_id: w.id
              })
            elsif i / 100 == 11
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "1100→1200",
                wordbook_id: w.id
              })
            elsif i / 100 == 12
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "1200→1300",
                wordbook_id: w.id
              })
            elsif i / 100 == 13
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "1300→1400",
                wordbook_id: w.id
              })
            elsif i / 100 == 14
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "1400→1500",
                wordbook_id: w.id
              })
            end


          elsif i >= 78 && n <= 99
            puts "#{i}番目は形容詞"
            puts el.css('a:first-child').text
            puts el.children[1].text[1..-2]
            if i / 100 == 4
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "0400→0500",
                wordbook_id: w.id
              })
            elsif i / 100 ==5
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "0500→0600",
                wordbook_id: w.id
              })
            elsif i / 100 ==6
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "0600→0700",
                wordbook_id: w.id
              })
            elsif i / 100 == 7
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "0700→0800",
                wordbook_id: w.id
              })
            elsif i / 100 == 8
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "0800→0900",
                wordbook_id: w.id
              })
            elsif i / 100 == 9
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "0900→1000",
                wordbook_id: w.id
              })
            elsif i / 100 == 10
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "1000→1100",
                wordbook_id: w.id
              })
            elsif i / 100 == 11
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "1100→1200",
                wordbook_id: w.id
              })
            elsif i / 100 == 12
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "1200→1300",
                wordbook_id: w.id
              })
            elsif i / 100 == 13
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "1300→1400",
                wordbook_id: w.id
              })
            elsif i / 100 == 14
              Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "1400→1500",
                wordbook_id: w.id
              })
            end
          end
        end
      end  
    end

    task level1600: :environment do 
      w = Wordbook.find_by(name: 'ターゲット1900')
      puts w.id
      doc.css('ol > li').each_with_index do |el, i|
        if i >= 1500 && i < 1535
          puts "#{i}番目は動詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "1500→1600",
                wordbook_id: w.id
              })
        elsif i  >= 1535 && i < 1572
          puts "#{i}番目は名詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "1500→1600",
                wordbook_id: w.id
              })
        elsif i >= 1572 && i < 1600
          puts "#{i}番目は形容詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "1500→1600",
                wordbook_id: w.id
              })
        end
      end
    end

    task level1700: :environment do 
      w = Wordbook.find_by(name: 'ターゲット1900')
      puts w.id
      doc.css('ol > li').each_with_index do |el, i|
        if i >= 1600 && i < 1635
          puts "#{i}番目は動詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "1600→1700",
                wordbook_id: w.id
              })
        elsif i  >= 1635 && i < 1672
          puts "#{i}番目は名詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "1600→1700",
                wordbook_id: w.id
              })
        elsif i >= 1672 && i < 1700
          puts "#{i}番目は形容詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "1600→1700",
                wordbook_id: w.id
              })
        end
      end
    end


    task level1800: :environment do 
      w = Wordbook.find_by(name: 'ターゲット1900')
      puts w.id
      doc.css('ol > li').each_with_index do |el, i|
        if i >= 1700 && i < 1735
          puts "#{i}番目は動詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "1700→1800",
                wordbook_id: w.id
              })
        elsif i  >= 1735 && i < 1772
          puts "#{i}番目は名詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "1700→1800",
                wordbook_id: w.id
              })
        elsif i >= 1772 && i < 1800
          puts "#{i}番目は形容詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "1700→1800",
                wordbook_id: w.id
              })
        end
      end
    end


    task level1900: :environment do 
      w = Wordbook.find_by(name: 'ターゲット1900')
      puts w.id
      doc.css('ol > li').each_with_index do |el, i|
        if i >= 1800 && i < 1835
          puts "#{i}番目は動詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "動詞",
                level: "1800→1900",
                wordbook_id: w.id
              })
        elsif i  >= 1835 && i < 1871
          puts "#{i}番目は名詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "名詞",
                level: "1800→1900",
                wordbook_id: w.id
              })
        elsif i >= 1871 && i < 1900
          puts "#{i}番目は形容詞"
          puts el.css('a:first-child').text
          puts el.children[1].text[1..-2]
          Word.create({
                english: el.css('a:first-child').text,
                japanese: el.children[1].text[1..-2],
                part: "形容詞",
                level: "1800→1900",
                wordbook_id: w.id
              })
        end
      end
    end



  end

end

# Word.create({
#   english: "super_word#{i}",
#   japanese: "発展単語#{i}",
#   part: "名詞",
#   level: "発展",
#   wordbook_id: 4
# })