require 'selenium-webdriver'
require 'byebug'

Selenium::WebDriver::Chrome::Service.driver_path = `which chromedriver`.chomp# 설치한 크롬 드라이버 사용
#Selenium::WebDriver::Chrome::Service.driver_path = '/Users/ju-young/.rbenv/shims/chromedriver-helper'
#크롬 창 열지않고 크롤링 (헤드리스)
options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting

# 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
@browser = Selenium::WebDriver.for :chrome, options: options

#원하는 페이지로 이동
@browser.navigate().to "https://gsis.korea.ac.kr/announcements/events"

#공지사항 제목 잡기
sleep(1);
@content = @browser.find_element(css: "#content > div.page-block > div.content-block > div > div > div.full-page-content")

 (1..20).each do |t|
    @url = @content.find_element(css: "div.full-page-content > a:nth-child(#{t})").attribute("href")
    @month = @content.find_element(css: "div.full-page-content > a:nth-child(#{t}) > div > div.event-date > div.event-month").text
    @day = @content.find_element(css: "div.full-page-content > a:nth-child(#{t}) > div > div.event-date > div.event-day").text
    @title = @content.find_element(css: "div.full-page-content > a:nth-child(#{t}) > div > div.event-title > div.eventmaintitle").text
    puts "#{@url}"
    puts "#{@month}"
    puts "#{@day}"
    puts "#{@title}"
  end

@browser.quit
