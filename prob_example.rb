require 'rubygems'
require 'midiator'
require 'probability_array'

require 'pp'

p = ProbabilityArray.new( { 60 => 0.3 , 67 => 0.2 , 63 => 0.1 , 72 => 0.4 } )

puts 'a probability sample'
qt = {}

(0..10000).each do
	n = p.get
	qt[n] ||= 0
	qt[n] += 1/10000.0
end

pp qt

puts 'a randomized Am chord'
midi = MIDIator::Interface.new
midi.autodetect_driver
midi.instruct_user!

while true
	note = p.get
	puts note
	midi.play note
	sleep 0.5
end


