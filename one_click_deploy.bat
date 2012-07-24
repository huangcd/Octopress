:: set up environment, in case there are some problem
rake generate
rake deploy
git add -A
git commit -m "update from one_click_deploy"
git push -u origin master
git push -u heroku master
