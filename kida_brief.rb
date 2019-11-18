require 'selenium-webdriver'
require 'byebug'

Selenium::WebDriver::Chrome::Service.driver_path = `which chromedriver`.chomp# 설치한 크롬
options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting

# 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
@browser = Selenium::WebDriver.for :chrome, options: options

#원하는 페이지로 이동
@browser.navigate().to "http://kida.re.kr/index.do?lang=en"
@browser.navigate().to "http://kida.re.kr/frt/board/frtNormalBoard.do?sidx=2327&depth=2"

#공지사항 제목 잡기
sleep(3);

@content = @browser.find_elements(css: '#content > div.table_web > div.table_area > table > tbody > tr')


@content.each do |t|
  @title = t.find_element(tag_name: "a").attribute('text').strip
  @url = "http://kida.re.kr/frt/board/frtNormalBoard.do?sidx=2327&depth=2"
  @year = t.find_element(css: " td:nth-child(2)").text()
  puts "#{@title}"
  puts "#{@url}"
  puts "#{@year}"
end

@browser.quit
