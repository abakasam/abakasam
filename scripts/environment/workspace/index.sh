#!/bin/bash

greet() 
{ 
    echo "hello" 
}
jump()
{
    label=$1
    block=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$block"
    exit    
}