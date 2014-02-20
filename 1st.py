from bs4 import BeautifulSoup

import requests

r  = requests.get("http://www.cbc.ca/radio/podcasts/index.html")

data = r.text

soup = BeautifulSoup(data)

for link in soup.find_all('a'):
    foundhref = link.get('href')
    print(foundhref)
