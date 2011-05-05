public class Mn {

    //defaults of the western modern music
    440 => float base;
    12 => int division;

    //this is gonna generate the sound for us
    Mandolin sound;

    //let's connect out sound to a generator
    public void connect( UGen u ) {
        sound => u;
    }

    //disconnect it so we can have silence
    public void disconnect( UGen u ) {
        sound =< u;
    }

    //use it so we can listen to the silence
    public void silence(UGen u, dur period) {
        disconnect(u);
        period => now;
        connect(u);
    }

    //here's is the meat, integer to frequency
    public void note( int index ) {
        <<< "playing a: ", index >>>;
        base * Math.pow(2, index/division $ float) => sound.freq;
        sound.noteOn(0.5);
    }

    //for our use and delight
    public float getBase() {
        return base;
    }

    public int getDivision() {
        return division;
    }

}
