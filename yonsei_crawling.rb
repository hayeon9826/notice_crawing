require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = `which chromedriver`.chomp# 설치한 크롬
options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting

# 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
@browser = Selenium::WebDriver.for :chrome, options: options

#원하는 페이지로 이동
@browser.navigate().to "https://gsis.yonsei.ac.kr/main/events.asp?mid=n06_06"

#공지사항 제목 잡기
sleep(1);

@content = @browser.find_elements(css: '#BBSBoard > tbody > tr')


@content.each do |t|
  @title = t.find_element(css: "td:nth-child(2)").text
  @date = t.find_element(css: "td:nth-child(4)").text
  @url = t.find_element(tag_name: "a").attribute("href")
  puts "#{@title}"
  puts "#{@date}"
  puts "#{@url}"
end

@browser.quit
