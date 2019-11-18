
require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = `which chromedriver`.chomp# 설치한 크롬
options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting

# 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
@browser = Selenium::WebDriver.for :chrome, options: options

#원하는 페이지로 이동
@browser.navigate().to "http://www.sejong.org/boad/22/egolist.php?bd=35"

#공지사항 제목 잡기
sleep(1);

@content = @browser.find_elements(css: 'div.bd_w.mt20 > div > ul > li')
#_wrap > div.inner > div > div.contants > form > div.bd_w.mt20 > div > ul > li:nth-child(1)

@content.each do |t|
  @title = t.find_elements(tag_name: "a").first.text
  @url = t.find_elements(tag_name: "a").first.attribute('href')
  @content = t.find_element(css: "div > div.lt_txt > p.desc").text
  @date = t.find_element(css:" p.datename > span.date").text
  puts "#{@title} // #{@url} // #{@content} // #{@date}"
end

@browser.quit
