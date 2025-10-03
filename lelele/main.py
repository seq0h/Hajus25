from selenium import webdriver
from selenium.webdriver.edge.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import os
import time

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By

options = webdriver.EdgeOptions()
prefs = {
    "profile.default_content_settings.popups": 0,
    "download.prompt_for_download": False
}
options.add_experimental_option("prefs", prefs)
options.add_argument("--start-maximized")
options.add_argument("--disable-blink-features=AutomationControlled")

service = Service(r"C:\Users\opilane\source\repos\edgedriver_win64\msedgedriver.exe")
driver = webdriver.Edge(service=service, options=options)
wait = WebDriverWait(driver, 15)

try:
    driver.get("https://www.wikipedia.org")
    time.sleep(2)

    search_box = driver.find_element(By.ID, "searchInput")
    search_box.send_keys("Python")
    time.sleep(1)

    search_box.send_keys(Keys.RETURN)
    time.sleep(2)

    driver.execute_script("window.scrollTo(0, 500);")
    time.sleep(1)

    driver.execute_script("window.scrollTo(0, 0);")
    time.sleep(1)

    driver.execute_script("window.open('https://www.w3schools.com/html/html_forms.asp');")
    driver.switch_to.window(driver.window_handles[1])
    time.sleep(2)

    name_input = driver.find_element(By.NAME, "firstname")
    name_input.send_keys("Test")
    time.sleep(1)

    lastname_input = driver.find_element(By.NAME, "lastname")
    lastname_input.send_keys("User")
    time.sleep(1)

    submit_button = driver.find_element(By.TAG_NAME, "button")
    submit_button.click()
    time.sleep(2)

finally:
    driver.quit()