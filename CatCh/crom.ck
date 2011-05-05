//our instance
Mn n;
n.connect(dac);

while (true) {

    for (0 => int i; i < n.getDivision(); i++) {
        n.note(i);
        100::ms => now;
    }
}

