# Usages

## Guessing Single Word

```bash
./guess.sh <len>
./guess.sh <len> <letter>
./guess.sh <len> <letter> <index>
```



Examples:

```
./guess.sh 12
cheeseburger

./guess.sh 11 u
bodybuilder

./guess.sh 11 n -1
celebration
./guess.sh 11 c 0
celebration
```



## Guessing Multiple Words

```
./guess.sh m <numWords>
```



Example:

```bash
./guess.sh m 3
3 2 3 tug of war
4 3 5 fish and chips
```



# Contributing New Words

Given a file of single words:

```
cat single_words.txt | sort | uniq | perl -ne 'push @a, $_ } { print sort { length $a <=> length $b } @a' > final_single_words.txt
```

