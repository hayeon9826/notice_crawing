
require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = `which chromedriver`.chomp# 설치한 크롬
options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting

# 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
@browser = Selenium::WebDriver.for :chrome, options: options

#원하는 페이지로 이동
@browser.navigate().to "https://www.northkoreanreview.net/news-and-events"

#공지사항 제목 잡기
sleep(1);


@urls = @browser.find_elements(css: 'span > span > a')
@content = @browser.find_element(css: "#CntnrfinlineContent")

@urls.count.times.each do |t|
  @title = @content.find_element(css: "#ih0ajgzb > p:nth-child(#{t*10 + 3}) > span > span").text
  @date = @content.find_element(css: "#ih0ajgzb > p:nth-child(#{t*10 + 5}) > span").text
  @url = @content.find_element(css: "#ih0ajgzb > p:nth-child(#{t*10 + 7}) > span > span > a").text
  puts "#{@title}"
  puts "#{@date}"
  puts "#{@url}"
end

@browser.quit
