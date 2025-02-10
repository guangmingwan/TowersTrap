1.download the 2d game engine 'love2d'
url: http://www.love2d.org/download
2. run 'r.bat'
content: "C:\Program Files\LOVE\love.exe" "C:\Program Files\LOVE\demos\TowersTrap"

3.for develop on github:
use proxy
git config --local http.proxy '127.0.0.1:10809'
git config --local https.proxy '127.0.0.1:10809'
remove proxy
git config --local --unset http.proxy
git config --local --unset https.proxy
