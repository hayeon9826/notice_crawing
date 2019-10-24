require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = "/usr/local/Caskroom/chromedriver/77.0.3865.40/chromedriver"# 설치한 크롬 드라이버 사용
#Selenium::WebDriver::Chrome::Service.driver_path = '/Users/ju-young/.rbenv/shims/chromedriver-helper'
#크롬 창 열지않고 크롤링 (헤드리스)
options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting

# 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
@browser = Selenium::WebDriver.for :chrome, options: options

#원하는 페이지로 이동
@browser.navigate().to "https://gsis.snu.ac.kr/upcoming_events"

#공지사항 제목 잡기
sleep(1);
@browser.find_element(css: "#snu_gsis > div.text-center > ul > li:nth-child(3) > a").click

@content = @browser.find_elements(css: '#upcoming_events > div:nth-child(2) > div > table > tbody > tr')
#upcoming_events > div:nth-child(2) > div > table > tbody > tr:nth-child(1) > td:nth-child(2) > a
puts "#{@content.map{|x| x }}"

@content.each do |t|
  @title = t.find_element(tag_name: "a").text
  @url = t.find_element(tag_name: "a").attribute("href")
  puts "#{@title} 이랑 #{@url}"
end

@browser.quit
