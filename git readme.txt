1. Musicie założyć konto na Githubie
* ściągnijcie gita oraz klienta gita , jest ich pełno

2. w dowolnym folderze
git init
git clone git@github.com:kamilgolabek1/ProjektInzynierski.git
git remote add origin git@github.com:kamilgolabek1/ProjektInzynierski.git
git add -A
git commit -m "first commmit"

3. Polecenia
//commit
git commit // lokalnie
git push -u origin master // globalnie

// update from remote
git pull


// jeśli macie ustawione inny remote to tym poleceniem update
git remote set-url origin git@github.com:kamilgolabek1/ProjektInzynierski.git

