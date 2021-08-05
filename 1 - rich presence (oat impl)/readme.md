This script will keep running even AFTER the game has been killed
Please make sure to properly close the script, else you'll be left with a stale rich presence!

## installation

`npm install`, you know the deal

## running it

`node index.js`

alternatively, if you want it to run at all times, youll want to install `pm2`:

`npm install -g pm2`

then run it with

`pm2 start index.js --name nitg-rich-presence`

`pm2 save`