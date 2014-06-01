#!/usr/bin/env python

import urllib2
import nltk
from bs4 import BeautifulSoup
import csv
pasdatad = {}
profiles = []
urls = []
profile = "/Users/gagan/dev/linkedin-graph/profilenames.csv"
profileReader = csv.reader(open(profile, 'rb'), delimiter=' ', quotechar='|')
for row in profileReader:   
	profiles.append(','.join(row))
title = "/Users/gagan/dev/linkedin-graph/url.csv"
titleReader = csv.reader(open(title, 'rb'), delimiter=' ',  quotechar='|')
for titl in titleReader:
    urls.append(','.join(titl))
for url, profile_name in zip(urls, profiles):
	page = urllib2.urlopen(url)
	soup = BeautifulSoup(page)
	title_span = soup.find_all('span', class_="title")
	titles = []
	for row in title_span:
		titles.append(list(row.stripped_strings))
	pasdatad[profile_name] = titles
	print profile_name
	print pasdatad[profile_name]

	with open("output.csv", "w") as f:
		writer = csv.DictWriter(f, pasdatad.keys())
		writer.writeheader()
		writer.writerow(pasdatad)
