:: set up environment, in case there are some problem
set LC_ALL=zh_CN.UTF-8
set LANG=zh_CN.UTF-8
rake generate
rake deploy
git add -A
git commit -m "update from one_click_deploy"
git push -u origin master
cd ..\blog_of_huangcd
git add -A
git commit -m "update from one_click_deploy"
git push -u origin master
