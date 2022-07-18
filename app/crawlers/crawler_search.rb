require "nokogiri"
require "open-uri"

class CrawlerSearch
    
    def create
        search_quotes
    end

    def search_quotes
        puts "Buscando as frases..."
        url = Nokogiri::HTML(URI.open("http://quotes.toscrape.com/")) 
        quotes = url.css('div.row').css('div.col-md-8')
        quotes.search('div.quote').each do |quote_search|
            item = {}
            item[:quote] = quote_search.css('span.text').css('span').text
            item[:author] = quote_search.css('small.author').css('small').text
            item[:author_about] = "http://quotes.toscrape.com#{quote_search.css('span a').attribute('href').value}" 
            tags_aux = quote_search.css('div.tags meta.keywords').attribute('content').value.split(',')
            puts item[:quote]
              
            tags = []
            tags_elements = quote_search.css('.tags').css('a.tag').css('a')
            tags_elements.each do |tag| 
                tags.push(Tag.find_or_create_by(tag: tag.text))                     
            end    
            quote = Quote.find_or_initialize_by(quote: item[:quote])
            quote.author = item[:author]
            quote.author_about = item[:author_about]
            quote.tags = tags
            quote.save          
            next if quote['nav.pager'] == 'nav.pager' 
        end
        puts "Frases salvas..."
    end
end