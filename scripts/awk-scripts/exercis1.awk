#!/usr/bin/awk -f

BEGIN {FS = ":"}

{
	print "dn: uid=" $1 ", dc=example, dc=com"
	print "cn: " $2 " " $3
	print "sn: " $3
	print "telephone number: " $4
	print ""
}

