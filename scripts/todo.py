#!/usr/bin/python
#
# Todo.py: Searches files in directory for todo's with the specified username
# To specify a todo in a file, type TODO(rft) or whatever username.
#
# Author: Robert Thompson
#
# Usage: python todo.py <user> <directory>
#

import sys
import os
import fnmatch
import re

def main():
  assert len(sys.argv) >= 2, \
    "Must have 3 arguments: todo <user> <dir>"
  user = None

  if len(sys.argv) == 2:
      directory = sys.argv[1]
  else:
      user = sys.argv[1]
      directory = sys.argv[2]


  if user: print 'Searching directory %s for user %s' % (directory, user)
  else: print 'Searching directory %s' % (directory)

  matches=[]
  tcount = 1
  for root, dirnames, filenames in os.walk(directory):
    for filename in [n for n in filenames if match(n)]:
      f = os.path.join(root,filename);
      tcount = findTodos(f,user, tcount);

def match(name):
  types = ['py', 'js']
  for t in types:
    if fnmatch.fnmatch(name,'*.'+t):
      return True
  return False

def findTodos(f,user, tcount):
  count = 1
  for line in open(f):
    if re_match(line, user):
#s = f+':'+str(count)+':'+line
      print '%d: %s:%s: %s' % (tcount, f, str(count), line),
      tcount+=1
    count+=1
  return tcount

def re_match(line, user):
    if user: return re.search('TODO\('+user+'\)', line)
    return re.search('TODO', line)


if __name__ == '__main__':
  main()
