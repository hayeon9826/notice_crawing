
require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = `which chromedriver`.chomp# 설치한 크롬
options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting

# 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
@browser = Selenium::WebDriver.for :chrome, options: options

#원하는 페이지로 이동
@browser.navigate().to "http://www.kinu.or.kr/www/jsp/prg/api/publ_main.jsp"

#공지사항 제목 잡기
sleep(1);

@content = @browser.find_elements(css: '#cmsContent > div > div')
#_wrap > div.inner > div > div.contants > form > div.bd_w.mt20 > div > ul > li:nth-child(1)

@content.each do |t|
  @list = t.find_elements(tag_name: "a")
  @list.each do |p|
    # puts "#{p}"
    title = p.text
    url = p.attribute('href')
    # puts "#{title}"
    # puts "#{url}"
    @page = Selenium::WebDriver.for :chrome, options: options
    @page.navigate().to "#{url}"
    sleep(1);
    date = @page.find_element(css: "#cmsContent > div.board_wrap_bbs > table > thead > tr:nth-child(2) > td").text.split('/').first
    puts "#{date}"
    @page.quit
    #cmsContent > div.board_wrap_bbs > table > thead > tr:nth-child(2) > td
  end
end

@browser.quit
