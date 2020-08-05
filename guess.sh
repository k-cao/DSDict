SINGLE_FILE=final_single_words.txt
MUTLI_FILE=final_multi_words.txt

argLen=${@}
argCount=0
for var in "$@"
do
    (( argCount++ ))
done

if [ $1 = "m" ]; then
    # Multiple words: ./guess.sh m <numWords>
    cat $MUTLI_FILE | while read line || [[ -n $line ]];
    do
        numWords=$(echo "$line" | wc -w)
        if [ $numWords == $2 ]; then
            let i=1
            while (( i <= $numWords )); do
                segLen=$(echo $line | awk '{print $var;}' var="${i}" | awk '{print length}')
                echo "$segLen \c"
                let i++
            done
            echo $line
        fi
    done
else
    grepExpr="^.{$1}$"
    possible=$(echo "$(grep -E "$grepExpr" $SINGLE_FILE)")

    if [ $argCount == 1 ]; then
        # Single word: ./guess.sh <len>
        echo $possible | tr " " "\n"
    elif [ $argCount == 2 ]; then
        # Single word: ./guess.sh <len> <letter>
        for word in $possible
        do
            if [[ $word == *"$2"* ]]; then
                echo $word
            fi
        done
    else
        # Single word: ./guess.sh <len> <letter> <index>
        # Note: index can be negative similar to python
        index=$3
        if (( $3 < 0 )); then
            let "index=$1+$3"
        fi

        for word in $possible
        do
            char="${word:$index:1}"
            if [[ $char == $2 ]]; then
                echo $word
            fi
        done
    fi
fi
