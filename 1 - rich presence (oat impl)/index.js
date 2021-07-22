const gaze = require('gaze');
const fs = require('fs');

const clientid = '867550886934347816';
let client = require('discord-rich-presence')(clientid);

const path = '../../../Data/StepMania.ini';

// make sure these are the same as the ones in Scrips/RichPresence.lua
const identifier = 'OATRPC@'
const seperator = '@'
const seperator2 = ':'

const updatePeriod = 5000; // time to wait between updates

function formatPresence(data) {
  let presence = {
    largeImageKey: 'icon',
    largeImageText: 'notitg.heysora.net',
  }

  if (data.state === 'Results') {
    presence.details = `${data.author} - ${data.title}`;
    presence.state = `${data.score}%`;
    presence.smallImageKey = 'results';
    presence.smallImageText = 'In Results';
  }
  if (data.state === 'Gameplay') {
    presence.details = `${data.author} - ${data.title}`;
    presence.state = `From ${data.pack}`;
    presence.smallImageKey = 'playing';
    presence.smallImageText = 'Ingame';
    presence.startTimestamp = data.songstart * 1000;
    presence.endTimestamp = data.songend * 1000;
  }

  if (data.state === 'Menu') {
    presence.details = 'Scrolling through songs';
    presence.smallImageKey = 'menu';
    presence.smallImageText = 'In Menus';
    presence.startTimestamp = data.browsingsince * 1000
  }

  return presence;
}

let lastStr = '';
let lastUpdate = Date.now();
let updateQueued = false
function updatePresence(force) {
  let stepmaniaini = fs.readFileSync(path, 'utf8');
  let p = stepmaniaini.split('\r\n').filter(s => s.startsWith('LastSeenVideoDriver='));

  if (p < 0) return console.log('W huh. no video driver prefs. weird !');

  let str = p[0].split('=').slice(1).join('=');
  if (str === lastStr && !force) return console.log('I video driver preference hasnt changed, likely something else modifying the config');
  lastStr = str;

  if (!str.startsWith(identifier)) return console.log('W video driver pref isnt oatrpc standard. make sure you\'re running the theme');

  let rpcObj = {};
  str.split(seperator).forEach(v => {
    let c = v.split(seperator2);
    if (c[0] !== '' && c[1]) rpcObj[c[0]] = c[1];
  });

  let presence = formatPresence(rpcObj);

  if ((Date.now() - lastUpdate) >= updatePeriod || force) {
    updateQueued = false
    lastUpdate = Date.now();
    client.updatePresence(presence);
  } else {
    // queue another update as soon as we can allow
    if (!updateQueued) {
      updateQueued = true
      setTimeout(() => updatePresence(true), updatePeriod - (Date.now() - lastUpdate))
    }
  }
}

console.log('👁️');
gaze(path, (err, watcher) => {
  watcher.on('all', () => {
    updatePresence();
  });
});
updatePresence();