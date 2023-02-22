#! /bin/bash

<<COMMENTS
Takes a single number (a temperature in Fahrenheit) as an ARGV variable,
converts it to Celsius and returns a new value.
The formula for Fahrenheit to Celsius is C = (F -32) * (5/9).
(HINT: ARGV variables are accessed using $ notation in order. Use echo "scale=... ; <expression>"
| bc for numerical computations.
"scale=" specifies number of decimal places. 2.32 would have scale=2.)

COMMENTS

echo "Enter Temperature in Fahrenheit"
read -p " Temperature: " number
echo "scale=2; (($number-32)*5)/9" | bc
