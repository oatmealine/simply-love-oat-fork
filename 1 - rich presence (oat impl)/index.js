const gaze = require('gaze');
const fs = require('fs');
const execSync = require('child_process').execSync;
const RPC = require('discord-rpc');

const clientid = '867550886934347816';
let client = new RPC.Client({transport: 'ipc'})

const path = '../../../Data/StepMania.ini';

const pref = 'LastSeenVideoDriver';

// make sure these are the same as the ones in Scrips/RichPresence.lua
const identifier = 'OATRPC@'
const seperator = '@'
const seperator2 = ':'

const executable = 'NotITG-v4.2.0';
let running = false;

const updatePeriod = 5000; // time to wait between updates

function isRunning(query) {
  let platform = process.platform;
  let cmd = '';
  switch (platform) {
      case 'win32' : cmd = `tasklist`; break;
      case 'darwin' : cmd = `ps -ax | grep ${query}`; break;
      case 'linux' : cmd = `ps -A`; break;
      default: break;
  }
  let stdout = execSync(cmd);
  return stdout.toString().toLowerCase().indexOf(query.toLowerCase()) > -1;
}

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

    if (data.marathon === 'true') presence.state = 'Marathon mode';
  }

  if (data.state === 'Menu' || !data.state) {
    presence.details = 'Scrolling through songs';
    if (data.pack && data.pack !== '') presence.state = `In ${data.pack}`;
    presence.smallImageKey = 'menu';
    presence.smallImageText = 'In Menus';
    presence.startTimestamp = (data.browsingsince || Date.now() / 1000) * 1000
  }

  if (data.state === 'Editor') {
    presence.details = 'In editor';
    presence.smallImageKey = 'menu'; // todo
    presence.smallImageText = 'Editor';

    if (data.playtesting === 'true') {
      presence.state = 'Playtesting';
      presence.smallImageKey = 'playing';
    }
    if (data.selecting === 'true') {
      presence.state = 'Selecting a song to edit...';
    }
  }

  if (data.state === 'Idle') {
    presence.details = 'Idling';
    presence.smallImageKey = 'menu';
    presence.smallImageText = 'Title Screen';
  }

  if (data.state === 'ColorSelect') {
    presence.details = 'Selecting a color';
    presence.smallImageKey = 'menu';
    presence.smallImageText = 'Color Select';
  }

  if (data.state === 'Options') {
    presence.details = 'Configuring options';
    presence.smallImageKey = 'menu'; // todo
    presence.smallImageText = 'Options';
  }

  if (presence.details) presence.details = presence.details.slice(0, 127);
  if (presence.state) presence.state = presence.state.slice(0, 127);

  return presence;
}

let lastStr = '';
let lastUpdate = Date.now();
let updateQueued = false
function updatePresence(force) {
  if (!running) return;
  let stepmaniaini = fs.readFileSync(path, 'utf8');
  let p = stepmaniaini.split('\r\n').filter(s => s.startsWith(pref + '='));

  if (p < 0) return console.log(`W huh. no ${pref} pref. weird !`);

  let str = p[0].split('=').slice(1).join('=');
  if (str === lastStr && !force) return /*console.log(`I ${pref} preference hasnt changed, likely something else modifying the config`)*/; // got too spammy
  lastStr = str;

  if (!str.startsWith(identifier)) return console.log(`W ${pref} pref isnt oatrpc standard. make sure you\'re running the theme`);

  let rpcObj = {};
  str.split(seperator).forEach(v => {
    let c = v.split(seperator2);
    if (c[0] !== '' && c[1]) rpcObj[c[0]] = c[1];
  });

  let presence = formatPresence(rpcObj);

  if ((Date.now() - lastUpdate) >= updatePeriod || force) {
    updateQueued = false
    lastUpdate = Date.now();
    client.setActivity(presence);
  } else {
    // queue another update as soon as we can allow
    if (!updateQueued) {
      console.log('I queuing a cancelled update');
      updateQueued = true
      setTimeout(() => updatePresence(true), updatePeriod - (Date.now() - lastUpdate))
    } else {
      console.log('W updates are being fired at a suspiciously high rate');
    }
  }
}

console.log('logging in');
client.login({clientId: clientid})
  .then(() => {
    setInterval(() => {
      if (isRunning(executable)) {
        if (!running) {
          console.log('I NotITG opened');
        }
        running = true;
        updatePresence();
      } else {
        if (running) {
          console.log('I NotITG closed');
          client.clearActivity();
        }
        running = false;
      }
    }, 1000);

    if (!isRunning(executable)) {
      console.log('W NotITG isn\'t running. staying silent for now');
    }
    console.log('👁️');
    gaze(path, (err, watcher) => {
      watcher.on('all', updatePresence);
      updatePresence();
    });
  });