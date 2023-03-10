// Sine oscillator at 220Hz
SinOsc osc1 => dac;
SinOsc osc2 => dac;
220 => osc1.freq;
229 => osc2.freq;

0.1 => osc1.gain;
0.1 => osc2.gain;

Wurley voc=> JCRev r => dac;

// initial settings
220.0 => voc.freq;
0.15 => voc.gain;
.8 => r.gain;
.1 => r.mix;

// scale
[ 0, 3, 7, 8, 11 ] @=> int scale[];

SndBuf kick => Gain g => dac;
// read in the file
me.dir() + "data/kick.wav" => kick.read;
.5 => g.gain;



// our main time loop
while( true )
{
    0 => kick.pos;
    // scale
    scale[Math.random2(0,scale.size()-1)] => int freq;
    Std.mtof( ( 33 + Math.random2(0,1) * 12 + freq ) ) => voc.freq;
    Math.random2f( 0.6, 0.8 ) => voc.noteOn;
    
    // note: Math.randomf() returns value between 0 and 1
    if( Math.randomf() > 0.9 )
    {
        // 1000::ms => now;
        repeat( 100 )
        {
            voc.freq() * 1.01 => voc.freq;
            10::ms => now;
        }
    }
    else if( Math.randomf() > .75 )
    {
        // 500::ms => now;
        repeat( 200 )
        {
            voc.freq() * .999 => voc.freq;
            10::ms => now;
        }
    }
    else if( Math.randomf() > .1 )
    {
        250::ms => now;
        
    }
    else
    {
        0 => int i;
        2 * Math.random2( 1, 3 ) => int pick;
        0 => int pick_dir;
        0.0 => float pluck;
        
        for( ; i < pick; i++ )
        {
            Math.random2f(.4,.6) + i*.035 => pluck;
            pluck + 0.03 * (i * pick_dir) => voc.noteOn;
            !pick_dir => pick_dir;
            1000::ms => now;
        }
    }
}


1::week => now;


//things i know need to be included
//two sine waves
//vocal synths
//string synths
//drums


//can't be a loop, everything should happen probabalistically

//do i prescribe a chord progression?
//is there some sort of markov chain to progress between them?


//define a tempo
//markov chain for chord progressions
//at each bar or segementation...
//new notes on is random
//pitches decided from chord progression
//type is random
