# BASH Book chapter 11 & 12


## Chapter 11 exercise 1
first sets varibles then checks if argument 1 is empty or not. if empty explain how to use the function.

then creates dir $print_dir.
Then checks if argument 2 is empty or not. If empty creates a file with the whole manpage and creates a file with everything within it then prints it with cups.
else 
print the specifikt paragraph of the manpage.
### how to use the function
```sh
source chapter11-ex1.sh
```
```sh
printman [args1] [args2 optional]
```
------------
## Chapter 11 exercise 2
The scripts set the varible. Then loops it 100 times and print output in terminal.
Then i echo the statement to the .bashrc.
 if the file exists, if it does it sources the script and the calls the functions.
### how to use the script
```sh 
./chapter11-ex2.sh
```


## chapter 12 exercise 1
First i creates a dummy file with dd that is 10 gig.
It runs it in the background with &
then i take the PID with $!
then i loop it so it waits for the process to complete
```sh
./chapter12-ex1.sh
```
## chapter 12 exercise 2
Downloads crawl repo and apt download dependencies and make.

set -m enables job control. which make all the processes run i separate process groups.
i take the PID with $! and use it in a whileloop. There i trap SIGINT and SIGTERM so you can't interuppt the installationprocess.
```sh
./chapter12-ex2.sh
```

