#!/bin/bash

# 以 " 分割 字段
#awk -F '"' '{
#    if ($2 > 0) {
#        if ($4 > 0) {
#            print "@property (nonatomic, copy) NSString *"$2";";
#        } else {
#            print "@property (nonatomic, strong) NSNumber *"$2";";
#        }
#    }
#}' $1


#awk -F "|"  -vOFS="|"  '{l=split($3,arr,",\"");
#$3="";
#traceid="";
#pixeldata=0;
#pixelcoordinate="";
#pixelabnormaldata="";
#collectedpixeldata="";
#for(i=1;i<=l;i++){
#gsub(/ /,"",arr[i]);gsub(/\"/,"",arr[i]);gsub(/\}/,"",arr[i]);gsub(/\{/,"",arr[i]);
#ll=split(arr[i],arr2,":");
#if(arr2[1]=="traceid") traceid=arr2[2];
#if(arr2[1]=="pixeldata") pixeldata=arr2[2];
#if(arr2[1]=="pixelcoordinate") pixelcoordinate=arr2[2];
#if(arr2[1]=="pixelabnormaldata") pixelabnormaldata=arr2[2];
#if(arr2[1]=="collectedpixeldata") collectedpixeldata=arr2[2];
#};$3=traceid"|"pixeldata"|"pixelcoordinate"|"pixelabnormaldata"|"collectedpixeldata;print}'


awk -F '""' '{
    if ($0~/title/) {
        print $0;
    }
#    if ($0~/titleId/) {
#        print $0;
#    }
}' $1
