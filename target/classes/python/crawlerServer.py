'''
Created on 2018. 3. 25.

@author: kim
'''
from flask import Flask, request
from bs4 import BeautifulSoup
from selenium import webdriver
from datetime import datetime
import time
import json
app = Flask(__name__)
@app.route("/")
def hell():
    return "hello"

@app.route("/search")
def requestTest():
    
    gender = request.args.get('gender')
    age = int(request.args.get('age'))
    content = int(request.args.get('content'))
    
    
    driver = webdriver.Chrome("chromedriver")
    driver.get("https://datalab.naver.com/shoppingInsight/sCategory.naver")
    
    #컨텐츠
    driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/span""").click()

    if content==0 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[1]/a""").click()
    
    elif content==1 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[2]/a""").click()
    
    elif content==2 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[3]/a""").click()
    
    elif content==3 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[4]/a""").click()
    
    elif content==4 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[5]/a""").click()
    
    elif content==5 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[6]/a""").click()
    
    elif content==6 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[7]/a""").click()
    
    elif content==7 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[8]/a""").click()
    
    elif content==8 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[9]/a""").click()
    
    elif content==9 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[10]/a""").click()
    
    elif content==10 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[1]/div/div[1]/ul/li[11]/a""").click()
    
    
    
    #성별
    if gender=="M":
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[4]/div/div/span[3]""").click()
    else :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[4]/div/div/span[2]""").click()
    
    #나이
    if age<20 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[5]/div/div/span[2]""").click()
    
    elif age>=20 and age<30 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[5]/div/div/span[3]""").click()
    
    elif age>=30 and age<40 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[5]/div/div/span[4]""").click()
    
    elif age>=40 and age<50 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[5]/div/div/span[5]""").click()
    
    elif age>=50 and age<60 :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[5]/div/div/span[6]""").click()
    
    else :
        driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/div/div[5]/div/div/span[7]""").click()
    
    #조회
    driver.find_element_by_xpath("""//*[@id="content"]/div[2]/div/div[1]/div/a""").click()

    time.sleep(2)
    
    
    res = driver.page_source
    soup = BeautifulSoup(res, "html.parser")

    top20 = soup.select("div > div.rank_top1000_scroll > ul > li > a" )
    print(type(top20))
    #print("크롤링시작+++++++++++++++++++++++")
    result=[]
    with open("result.txt","w",encoding="utf-8") as file:
        for e in top20:
            file.writelines(e.find("span").next_sibling.string.strip()+"\n")
        
    #print(json.dumps(result))
    time.sleep(1)
    driver.close()
    #driver.quit()
    
    return "ok"

if __name__ == '__main__':
    app.run(debug=True,host="127.0.0.1",port=5000)