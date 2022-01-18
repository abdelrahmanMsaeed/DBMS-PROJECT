#!/bin/bash

hamda=`awk -F";" '{print $1}' DBS/test/moss`
for i in $hamda
do
    echo $i
done

