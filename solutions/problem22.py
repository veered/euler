import os
import re

os.chdir("/Users/lucas/Documents/project_euler/solutions")
data = open('data/names.txt').read()

names = [s.strip(' "').lower() for s in data.split(",")]
names.sort()

def score(pos, name):
    return pos * sum([ord(c) - ord('a') + 1 for c in name])

print sum([score(i+1, name) for i, name in enumerate(names)])
