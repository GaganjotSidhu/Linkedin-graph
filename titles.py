#!/usr/bin/python

import urllib2
import nltk
from bs4 import BeautifulSoup
import csv
def main():
	pasdatad = {}
	profiles = ['daladamson','anmolnijjar', 'satchipanda']
	for profile_name in profiles:
		url = "https://www.linkedin.com/in/" + profile_name
		page = urllib2.urlopen(url)
		soup = BeautifulSoup(page)
		title_span = soup.find_all('span', class_="title")
		titles = []
		for row in title_span:
			titles.append(list(row.stripped_strings))
		pasdatad[profile_name] = titles
		#print pasdatad[profile_name]
		print profile_name
		print pasdatad[profile_name]
	
	with open("output.csv", "w") as f:
		writer = csv.DictWriter(f, pasdatad.keys())
		writer.writeheader()
		writer.writerow(pasdatad)

if __name__ == '__main__':
	main()

		# chmod 775 file.python makes executable
		# add #!/usr/bin/python
		# ls -l to check permissions
		# read the google python syle editor
		# add special function url for special cases
