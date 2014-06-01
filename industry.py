#!/usr/bin/env python

import urllib2
import nltk
from bs4 import BeautifulSoup
import csv
import itertools
pasdatad = {}
profiles = []
urls = []
profile = "/Users/gagan/dev/linkedin-graph/linkedin/profilenames.csv"
profileReader = csv.reader(open(profile, 'rU'), delimiter=' ', quotechar='|')
for row in profileReader:   
	profiles.append(','.join(row))
title = "/Users/gagan/dev/linkedin-graph/linkedin/urls.csv"
titleReader = csv.reader(open(title, 'rU'), delimiter=' ',  quotechar='|')
for titl in titleReader:
    urls.append(','.join(titl))
for url, profile_name in zip(urls, profiles):
	page = urllib2.urlopen(url)
	soup = BeautifulSoup(page)
	title_span = soup.find_all("dd", class_="industry")
	titles = []
	moo = []
	for row in title_span:
		titles.append(list(row.stripped_strings))
	print titles	
#	merged_list = list(itertools.chain(*titles))
    	#print merged_list
 #   	moo = [str(item) for item in merged_list]
	
	pasdatad[profile_name] = titles
	#print pasdatad[profile_name]
	
	
	with open("output.csv", "w") as f:
		writer = csv.DictWriter(f, pasdatad.keys())
		writer.writeheader()
		writer.writerow(pasdatad)
