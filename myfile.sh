#! /bin/bash
echo "Enter your favorite programming languages "
read -p " Enter number : " number
if [ $number -gt 50 ]; then
    echo "Value is greater than 50"
    if (( $number % 2  == 0)); then
        echo "Value is even"
    fi
fi

for i in $(seq 1 5)
do
    echo $i
done

for process in $(ps aux | awk '{print $11}')
do
    echo $process
done
multiply () {
    echo $(($1 * $2))
}

while [ $number -gt 1 ]
do
    echo $number
    (( number-- ))
    multiply $number $number
done


