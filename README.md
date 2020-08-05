Given a file of single words:

```
cat single_words.txt | sort | uniq | perl -ne 'push @a, $_ } { print sort { length $a <=> length $b } @a' > final_single_words.txt
```
