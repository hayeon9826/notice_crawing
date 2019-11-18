 require 'selenium-webdriver'

 Selenium::WebDriver::Chrome::Service.driver_path = `which chromedriver`.chomp# 설치한 크롬
 options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
 options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
 options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting

 # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
 @browser = Selenium::WebDriver.for :chrome, options: options

 #원하는 페이지로 이동
 @browser.navigate().to " http://www.inss.re.kr/contents/publications_ib.htm"

 #공지사항 제목 잡기
 sleep(1);

 @content = @browser.find_elements(css: '#contentBox > div.contentBody > div > table > tbody')

 @content.each do |t|
   @title = t.find_element(css: "b").text
   #contentBox > div.contentBody > div > table > tbody:nth-child(9) > tr.tr03 > td.td02 > p:nth-child(1)
   #contentBox > div.contentBody > div > table > tbody:nth-child(1) > tr.tr03 > td.td02 > p:nth-child(1) > span > b
   #contentBox > div.contentBody > div > table > tbody:nth-child(2) > tr.tr03 > td.td02 > div:nth-child(1) > b > span
   #contentBox > div.contentBody > div > table > tbody:nth-child(3) > tr.tr03 > td.td02 > p:nth-child(1) > span > b
   #contentBox > div.contentBody > div > table > tbody:nth-child(4) > tr.tr03 > td.td02 > div:nth-child(1) > span > b
   #contentBox > div.contentBody > div > table > tbody:nth-child(5) > tr.tr03 > td.td02 > div:nth-child(1) > span > b
   #contentBox > div.contentBody > div > table > tbody:nth-child(6) > tr.tr03 > td.td02 > p:nth-child(1) > b > span
   #contentBox > div.contentBody > div > table > tbody:nth-child(7) > tr.tr03 > td.td02 > div:nth-child(1) > span > b
   #contentBox > div.contentBody > div > table > tbody:nth-child(8) > tr.tr03 > td.td02 > div:nth-child(1) > span > b
   #contentBox > div.contentBody > div > table > tbody:nth-child(9) > tr.tr03 > td.td02 > p:nth-child(1) > span
   #contentBox > div.contentBody > div > table > tbody:nth-child(10) > tr.tr03 > td.td02 > div:nth-child(1) > span > b
   @date = t.find_element(css: "tr.tr04 > td").text

   # @url = "http://www.inss.re.kr/contents/publications_ib.htm"
   puts "#{@title}"
   puts "#{@date}"
   # puts "#{@url}"
 end

 @browser.quit
