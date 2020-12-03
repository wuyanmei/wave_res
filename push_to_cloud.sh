#!/bin/bash
#git fetch tcloud
#git merge -s recursive -X theirs tcloud/master
#echo "------------------ fetch all ------------------ "
#git fetch --all

echo "------------------ Pull from github ------------------ "
git reset --hard github/master
git pull github master

cp ../WavePatterns/out/match_stocks.json ./
#cp ../WavePatterns/out/summary.ebk ./
cur_date="`date +%Y-%m-%d`"
git add match_stocks.json

profile_result="../WavePatterns/out/profile_indexes.json"
if [ -f "$profile_result" ]; then
    cp  "$profile_result" ./
    git add profile_indexes.json
fi

git commit -m "1. update wave_patten results at  "$cur_date

if [ -z "$1" ]
then
	echo "input is null"
	exit 0
fi


if [[ "$1" == *"tcloud"* ]]
then
	echo "------------------ push to tlcoud ------------------ "
	git push -f tcloud
fi

if [[ "$1" == *"github"* ]]
then
	echo "------------------- push to github ------------------ "
	git push -f github
fi

if [[ "$1" == *"gitee"* ]]
then
	#echo "------------------ Pull from gitee ------------------ "
	#git reset --hard gitee2/master
	#git pull gitee2 master
	echo "------------------- push to gitee ------------------ "
	git push -f gitee2
fi

