#!/bin/sh

if [ -z "$1" ]
then
	echo "input is null"
	exit 0
fi

echo "------------------ reset git repo to $1 ------------------ "

git pull $1
#git fetch $1
#git reset --hard $1/master

match_result="../WavePatterns/out/match_stocks.json"
if [ -f "$match_result" ]; then
	cp  "$match_result" ./
	git add match_stocks.json
fi

tdx_stocks="../WavePatterns/out/tdx_stocks.json"
if [ -f "$tdx_stocks" ]; then
	cp  "$tdx_stocks" ./
	git add tdx_stocks.json
fi

profile_result="../WavePatterns/out/profile_indexes.json"
if [ -f "$profile_result" ]; then
	cp  "$profile_result" ./
	git add profile_indexes.json
fi

cur_date="`date +%Y-%m-%d`"
git commit -m "1. update wave_patten results at  "$cur_date

#git push -f $1
git push $1

echo "------------------- push to "$1" ------------------ "

