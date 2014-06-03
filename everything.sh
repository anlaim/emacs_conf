#!/bin/bash

cmd="locate -i $1"
while [ $# -gt 0 ];
do
    cmd="$cmd | grep -i $1";
    shift;
done

eval $cmd
