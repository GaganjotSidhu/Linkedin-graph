#!/usr/bin/python

!/usr/bin/env python
import json
import urllib2
import nltk
from bs4 import BeautifulSoup
import csv
import itertools
finalData = {}
pasdatad = {}
profiles = []
urls = []
degree = []
industry = []

profile = "/Users/gagan/dev/linkedin-graph/profilenames.csv"
profileReader = csv.reader(open(profile, 'rU'), delimiter=' ', quotechar='|')
for row in profileReader:   
	profiles.append(','.join(row))
title = "/Users/gagan/dev/linkedin-graph/urls.csv"
titleReader = csv.reader(open(title, 'rU'), delimiter=' ',  quotechar='|')
for titl in titleReader:
    urls.append(','.join(titl))
for url, profile_name in zip(urls, profiles):
	page = urllib2.urlopen(url)
	soup = BeautifulSoup(page)
	title_span = soup.find_all('span', class_="title")
	degree_span = soup.find_all('span', { 'class' : ["degree", "major"]})
	#major_span = soup.find_all('span', class_="major")
	industry_span = soup.find_all('dd',class_="industry")
	#pasdatad['Name'] = profile_name
	titles = []
	for row in title_span:
		titles.append(list(row.stripped_strings))

	#pasdatad[profile_name] = titles

	for row in degree_span:
		titles.append(list(row.stripped_strings))
		#pasdatad['degree'] = degree
	
	
	for row in industry_span:
		titles.append(list(row.stripped_strings))

	pasdatad[profile_name] = titles
	with open('allData.json','w') as f:
		json.dump(pasdatad,f,indent = 2)
	    

    



	#output.append(pasdatad)
