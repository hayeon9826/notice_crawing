require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = `which chromedriver`.chomp# 설치한 크롬
options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting

# 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
@browser = Selenium::WebDriver.for :chrome, options: options

#원하는 페이지로 이동
@browser.navigate().to "http://en.asaninst.org/contents/category/upcoming-events/"

#공지사항 제목 잡기
sleep(1);

@content = @browser.find_elements(css: '#content > div > div:nth-child(1) > article')


@content.each do |t|
  @title = t.find_elements(tag_name: "a").first.text
  @year = t.find_element(css: " div.post_date > span.year").text
  @month = t.find_element(css: " div.post_date > span.month").text
  @day = t.find_element(css: " div.post_date > span.day").text
  @url = t.find_elements(tag_name: "a").first.attribute("href")
  @date = "#{@year}-#{@month}-#{@day}"
  puts "#{@title}"
  puts "#{@date}"
  puts "#{@url}"
end

@browser.quit
