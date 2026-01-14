#!/usr/bin/awk -f

BEGIN { FS = "\t" }

$1 ~ /^M/ {
    print "<row>"
    print "<entry>" $1 "</entry>"
    print "<entry>"
    print $2,$3,$4
    print "</entry>"
    print "</row>"
}
$1 ~ /^m/ {
    print "<row>"
    print "<entry>" $1 "</entry>"
    print "<entry>"
    print $3,$4
    print "</entry>"
    print "</row>"
}
$1 ~ /^o/ {
    print "<row>"
    print "<entry" $1 "</entry>"  
    print "<entry>"
    print $2,$3
    print "</entry>"
    print "</row>"
}

$1 ~ /^t/ {
    print "<row>"
    print "<entry" $1 "</entry>"
    print "<entry>"
    print $2,$3,$4,$5,$6,$7        
    print "</entry>"
    print "</row>"
}
