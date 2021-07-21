const gaze = require('gaze');
const fs = require('fs');

const clientid = '867550886934347816';
let client = require('discord-rich-presence')(clientid);

const path = '../../../Data/StepMania.ini';

const identifier = 'OATRPC@'
const seperator = '@'
const seperator2 = ':'

console.log('👁️');
gaze(path, (err, watcher) => {
  watcher.on('all', async (event, path) => {
    //console.log(`received ${event} at ${path}`);
    let stepmaniaini = fs.readFileSync(path, 'utf8');
    let p = stepmaniaini.split('\r\n').filter(s => s.startsWith('LastSeenVideoDriver='));

    if (p < 0) return console.log('huh. no video driver prefs. weird !');

    let str = p[0].split('=').slice(1).join('=');

    if (!str.startsWith(identifier)) return console.log('video driver pref isnt oatrpc standard, it seems,');

    let rpcObj = {};
    str.split(seperator).forEach(v => {
      let c = v.split(seperator2);
      if (c[0] !== '' && c[1]) rpcObj[c[0]] = c[1];
    });

    let presence = {
      largeImageKey: 'icon',
    }

    if (rpcObj.state === 'Results' || rpcObj.state === 'Gameplay') presence.details = `${rpcObj.author} - ${rpcObj.title}`;
    if (rpcObj.state === 'Menu') presence.details = 'Scrolling through songs';

    if (rpcObj.state === 'Results') presence.state = `In results | ${rpcObj.score}%`;
    if (rpcObj.state === 'Gameplay') presence.state = `Ingame | From ${rpcObj.pack}`;

    if (rpcObj.state === 'Gameplay') presence.startTimestamp = rpcObj.songstart * 1000;
    if (rpcObj.state === 'Gameplay') presence.endTimestamp = rpcObj.songend * 1000;

    if (rpcObj.state === 'Menu') presence.startTimestamp = rpcObj.browsingsince * 1000;

    client.updatePresence(presence)

    //console.log(rpcObj);
  });
});