# remember to run in MacOS: brew install geckodriver

from selenium import webdriver
import time, sys, datetime, psutil
from bs4 import BeautifulSoup

#set profile for firefox
fp = webdriver.FirefoxProfile()
fp.set_preference("http.response.timeout", 20)
fp.set_preference("dom.max_script_run_time", 20)
browser = webdriver.Firefox(firefox_profile=fp)

#browser	= webdriver.Firefox()

#navigate the website
browser.get('http://ansibenevento.unilearning.it/login')
userElem =browser.find_element_by_id('username')
userElem.send_keys('antonio.decristofaro') #admn no here
passwordElem =browser.find_element_by_id('password')
passwordElem.send_keys('studopam20') # password here
loginElem = browser.find_element_by_id('login_btn')
loginElem.click()

#print("1")
print(browser.current_url)
browser.implicitly_wait(25) # seconds
browser.find_element_by_link_text('Segui corso').click()

#print("2")
print(browser.current_url)
browser.implicitly_wait(25) # seconds
browser.find_element_by_link_text('Play Course').click()


#print("3")
print(browser.current_url)

counter=0
#print(browser.current_url, type(browser.current_url), type("http://ansibenevento.unilearning.it/play-course/43/97/513/1581/2502"))
#while (browser.current_url == "http://ansibenevento.unilearning.it/play-course/43/97/513/1581/2502"):
while ("http://ansibenevento.unilearning.it/play-course/" in browser.current_url):

    timer= str(datetime.timedelta(seconds=counter))
    #print(timer)
    print(f'Current time: {timer}')
    print(browser.current_url)
        
    print(f'Current time: {timer}', end='\r', flush=True)
    #sys.stdout.write("Current time: %s%    \r" % (timer) )
    sys.stdout.flush()

    #print(counter, end="\r", flush=True)
    #print(counter)
    time.sleep(1)
    counter +=1



#elapsed = seconds_elapsed()
#print(elapsed)
exit(0)


