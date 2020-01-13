export const command = "pmset -g batt | tail -n 1 | awk '{print $3; print $4}'";
export const refreshFrequency = 100;

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

  let time = pad(now.getHours(), 2) + ":" + pad(now.getMinutes(), 2);

  //let date = now.getFullYear() + "-" + (pad(now.getMonth() + 1, 2)) + "-" + pad(now.getDate(), 2);
  let date = new Date().toLocaleString()


  return [<div style={style}>{desc}: {power}</div>, <div style={style}>{date}</div>, <div style={style}>{time}</div>]
}
