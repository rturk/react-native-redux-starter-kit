#!/bin/bash

echo "Input your project name (like App), followed by [ENTER]:"
read project

array=( package.json src test android ios )

for i in "${array[@]}"
do
  lc=$(echo "$project" | tr '[:upper:]' '[:lower:]') ;
  replace 'App' $project $i -r ;
  replace 'app' $lc $i -r ;
done

mv ios/App ios/$project
mv ios/App.xcodeproj ios/"$project".xcodeproj
mv ios/AppTests/AppTests.m ios/AppTests/"$project"Tests.m
mv ios/AppTests ios/"$project"Tests
mv android/app/src/main/java/com/app android/app/src/main/java/com/$project
