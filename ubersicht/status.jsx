let refreshFrequencyInSeconds = 30; 

var dayNames = [
    "Sun",
    "Mon",
    "Tues",
    "Weds",
    "Thurs",
    "Fri",
    "Sat"
];

export const command = "pmset -g batt | tail -n 1 | awk '{print $3; print $4}'";
export const refreshFrequency = refreshFrequencyInSeconds * 1000; // milliseconds

export const className = {
  top: 10,
  right: 40,
  color: '#ccc',
  fontFamily: 'Inconsolata',
  userSelect: "none",
};

// stackoverflow confirms that there's no good way to do this :(
function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}

function getDate(now) {
	let dayName = dayNames[now.getDay()];
	let year = now.getFullYear();
	let month = pad(now.getMonth() + 1, 2);// lol 0-based indexing on months
	let date = pad(now.getDate(), 2);
	return `${dayName} ${year}-${month}-${date}`;
}

function getTime(now) {
	let hours = pad(now.getHours(), 2);
	let minutes = pad(now.getMinutes(), 2);
	let seconds = pad(now.getSeconds(), 2);
	return `${hours}:${minutes}.${seconds}`;
}

export const render = ({output, error}) => {
  if (error) {
    return (<div>Something went wrong: <strong>{String(error)}</strong></div>);
  }

  let style = {
      userSelect: "none",
      textAlign: "center",
      borderRadius: "0.4em",
      margin: "0.2em",
      display: "inline",
      background: "rgba(0,0,0,.65)",
      padding: "0.3em 0.5em 0.3em 0.5em",
  };
  let res = output.split("\n");
  let power = res[0].slice(0, -1)
  let desc = res[1].slice(0, -1)

  let now = new Date();
  let time = getTime(now);
  let date = getDate(now);

  return [<div style={style}>{desc}: {power}</div>, <div style={style}>{date}</div>, <div style={style}>{time}</div>]
}
