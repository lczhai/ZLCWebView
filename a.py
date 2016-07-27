# coding=utf-8
# Copyright (c) 2015 royJang
# the MIT license
# python a.py 3650 2015-08-04

from datetime import date, timedelta
from random import randint
from time import sleep
import sys
import subprocess
import os

#从某一天开始
def get_date_string(n, startdate):
	d = startdate - timedelta(days=n)
	rtn = d.strftime("%a %b %d %X %Y %z -0400")
	return rtn

# main app
def main(argv):
	if len(argv) < 1 or len(argv) > 2:
		print "Error: Bad input."
		sys.exit(1)
	n = int(argv[0])
	if len(argv) == 1:
		startdate = date.today()
	if len(argv) == 2:
		startdate = date(int(argv[1][0:4]), int(argv[1][5:7]), int(argv[1][8:10]))
	i = 0
	while i <= n:
		curdate = get_date_string(i, startdate)
		num_commits = randint(1, 10)
		for commit in range(0, num_commits):
			subprocess.call("echo '" + curdate + str(randint(0, 1000000)) +"' > realwork.txt; git add realwork.txt; GIT_AUTHOR_DATE='" + curdate + "' GIT_COMMITTER_DATE='" + curdate + "' git commit -m 'update'; git push origin master;", shell=True)
			sleep(.5)
		i += 1
	subprocess.call("git rm realwork.txt; git commit -m 'delete'; git push origin master;", shell=True)

if __name__ == "__main__":
	main(sys.argv[1:])