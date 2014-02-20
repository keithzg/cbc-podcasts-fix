from bs4 import BeautifulSoup

import requests
import sys

getURL = sys.argv[ 1 ]

r  = requests.get(getURL)

data = r.text

soup = BeautifulSoup(data)

for link in soup.find_all('a'):

    foundhref = link.get('href')
    print(foundhref)
	
	
	#rrr = requests.request("GET", foundhref)
	#data2 = rr.text
	#newsoup = BeautifulSoup(data2)
	
	#for link in newsoup.find_all('a'):
	# print(link.get('href'))
