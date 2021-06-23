@echo off
rem  ---------------- Wave Patterns ----------------
rem  --   CopyRight of feiniao2000                --
rem  ----输入参数1：  git库名 ----------------

if "%1"=="" (
echo Usage: %0 [git_name]
goto :end
)

echo 'WaveRes work dir is: '%cd%
rem  ---------------- 刷新git库 ----------------
echo 'Flush git repo from' %1%
git pull %1% 

copy ..\WavePatterns\out\match_stocks.json .\
copy ..\WavePatterns\out\summary.ebk .\
copy ..\WavePatterns\resources\tdx_stocks.json .\
set time_tag=1. update wave_patten results at  %date:~0,10% %time:~0,12%
git commit -am "%time_tag%"
git push %1%

:end
cd ..\WavePatterns