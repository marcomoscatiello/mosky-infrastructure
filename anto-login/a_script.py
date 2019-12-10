# remember to run in MacOS: brew install geckodriver
from selenium import webdriver
#from pyvirtualdisplay import Display
import time

#display = Display(visible=0, size=(800, 600))
#display.start()
browser	= webdriver.Firefox()

#browser = webdriver.PhantomJS()
browser.get('http://ansibenevento.unilearning.it/login')
userElem =browser.find_element_by_id('username')
userElem.send_keys('antonio.decristofaro') #admn no here
passwordElem =browser.find_element_by_id('password')
passwordElem.send_keys('studopam20') # password here
loginElem = browser.find_element_by_id('login_btn')
loginElem.click()

browser.implicitly_wait(25) # seconds
browser.find_element_by_link_text('Segui corso').click()

browser.implicitly_wait(25) # seconds
browser.find_element_by_link_text('Play Course').click()

time.sleep(25)
print("after 25 secs")
current = browser.current_url
print(current)
time.sleep(30)
print("after 30 secs")
