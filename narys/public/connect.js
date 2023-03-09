num = 0;
let intervalID;

function connect()
{
    theChuck.getInt("SLICE").then((value) =>
    {
        num = value;
        printRow(num);
    });
}

const grid = document.getElementById('grid');
function printRow (num) {
    let max = 212
    s = "";
    for (let i = 0; i < max; i++) {
        if (i == num) {
            s += "rickroll";
        } else {
            s += "_";
        }
    }
    grid.innerHTML = s + "<br>" + grid.innerHTML;
}

//--------------------------------------
// JS Sync Functions
// -------------------------------------
function sync()
{
    intervalID = setInterval(connect, 100);
}

function stopSync()
{
    clearInterval(intervalID);
}
