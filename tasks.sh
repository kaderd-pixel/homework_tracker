
#!/bin/bash

# Reads a homework file and prints each assignment with a number

process_tasks() {
    filename="$1"
    count=0

    echo "Your homework assignments:"

    while IFS= read -r task || [ -n "$task" ]
    do
        if [ -n "$task" ]; then
            count=$((count + 1))
            echo "$count. $task"
        fi
    done < "$filename"

    if [ "$count" -eq 0 ]; then
        echo "No homework assignments found."
    fi
}

if [ "$#" -ne 1 ]; then
    echo "Usage: ./tasks.sh FILENAME"
    exit 1
elif [ ! -f "$1" ]; then
    echo "Error: File not found."
    exit 1
else
    process_tasks "$1"
fi

