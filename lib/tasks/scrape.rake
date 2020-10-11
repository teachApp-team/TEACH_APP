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
  namespace :system do
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