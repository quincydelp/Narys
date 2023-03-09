const mainButton = document.getElementById('mainButton');

// Read in Chuck Code
code = fetch("my-file.ck")
    .then(response => response.text())
    .then(text => { code = text; });

let state = -1;

// MAIN BUTTON
mainButton.addEventListener('click', async () =>
{
    if (state == -1)
    {
        // Load 
        await startChuck();
        await code;

        // Run
        state = 1;
        mainButton.innerHTML = "Play";

    } else if (state == 0)
    {
        // Stop
        await theChuck.removeLastCode();
        state = 1;
        mainButton.innerHTML = "Play";
        stopSync();

    } else if (state == 1)
    {
        // Run
        await theChuck.runCode(code);
        state = 0;
        mainButton.innerHTML = "Stop";
        sync();
    }
});
