require 'rubygems'
require 'midiator'

include MIDIator::Notes

INTERVAL = 0.3

# kinda boilerplate in my opinion, but it's very nice for
# those who are musically inclined
BMinor = [B4, Fs4, B5 , D5].reverse
CMajor = [C4, G4, C5, E5].reverse
EMinor = [E3, B4, E4, G4].reverse
FsMajor = [Fs3, Cs4, Fs5, As5].reverse


chords = { 'bm' => BMinor, 'c' => CMajor, 'em' => EMinor, 'fs' => FsMajor }
list = [ 'bm' , 'bm' , 'c' , 'em' , 'fs', 'fs' ]

midi = MIDIator::Interface.new
midi.autodetect_driver
midi.instruct_user!

#the main track, it just plays the arpeggios
main = Thread.new {
	while true
		list.each do |c|
			puts c
			chords[c].each do |n| midi.play n
				sleep INTERVAL
			end
		end

	end
}

# the additional threaded tracks, they start one after the other and keep
# on going until they've played a certain number of times
# you can play with the number of threads and with the delay to see what happens :)

tracks = (1..5).to_a.map do |delay|
	Thread.new {
		sleep INTERVAL*16 + delay
		i = 0
		while i < (5 - i)
			puts "thread #{delay}"
			i += 1
			list.each do |c|
				puts c
				chords[c].each do |n| midi.play n
					sleep INTERVAL
				end
			end
		end
		Thread.stop
	}
end

# play it!
main.join
tracks.each { |t| t.join }

