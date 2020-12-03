@echo off

rem  ---------------- Wave Patterns ----------------
rem  --   CopyRight of feiniao2000                --
rem  ---------------- Wave Patterns ----------------

echo 'Current work dir is: '%cd%
rem  ---------------- 刷新git库 ----------------
echo 'Flush git repo'
git pull

copy ..\WavePatterns\out\match_stocks.json.txt .\
copy ..\WavePatterns\out\summary.ebk .\
set time_tag=1. update wave_patten results at  %date:~0,10% %time:~0,12%
git commit -am "%time_tag%"
git push tcloud
