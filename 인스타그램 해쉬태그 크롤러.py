#!/usr/bin/env python
# coding: utf-8

# In[145]:


import selenium
from selenium import webdriver
from bs4 import BeautifulSoup
import time
import sys
from selenium.webdriver.common.keys import Keys
import urllib.request as req
import requests


# In[27]:


driver = webdriver.Chrome('./chromedriver.exe')


# In[196]:


# 검색어 정하기
search = '사회문제'
# 게시물 개수 정하기 ~~개 이상
number_of_link = 20

#
url = 'http://www.instagram.com/explore/tags/'+search+'/'
driver.get(url)
#
act = True

# 게시물 개수 구하기
pageString = driver.page_source
bsObj = BeautifulSoup(pageString, "lxml")
n= bsObj.find(name = 'span', attrs = { "class" : "g47SY"}).text

N = int(n.replace(',', ''))

# 게시물 각각 링크 구하기
link_list = []
elem = driver.find_element_by_tag_name('body')
while act :
    pageString = driver.page_source
    bsObj = BeautifulSoup(pageString, "lxml")
    
    link = bsObj.find_all(name = 'div', attrs = { "class" : "Nnq7C weEfm"})
    
    for link1 in link :
        for i in range(3) :    
            tmp = link1.select('a')[i]
            link_list.append(tmp.attrs['href'])
            
    for j in range(4) :
        elem.send_keys(Keys.PAGE_DOWN)
    
    
    link_list = list(set(link_list))
 

 # 정지 조건
    if  len(link_list) > number_of_link :
        act = False
    if len(link_list) == N :
        act = False
        
# 각각 게시물에서 해쉬태그 추출하기
# 각각 게시물에서 추출한 해쉬태그를 리스트에 담고, 
# 이 리스트를 하나의 리스트로 합침

hashtag = []

for x in link_list :
    word_list = []
    
    url = 'https://www.instagram.com/' + x
    res = requests.get(url)
    data = BeautifulSoup(res.content, "html.parser")
    
    tmp = data.find_all(attrs = { "property" : "instapp:hashtags"})
    for y in tmp :
        word_list.append(y['content'])
    
    tmp = data.find_all(attrs = { "property" : "video:tag"})
    for y in tmp :
        word_list.append(y['content'])

    hashtag.append(word_list)

print("총 게시물 개수는 "+n)
print("추출한 게시물의 개수는" + str(len(link_list)))

