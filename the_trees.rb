
require 'rubygems'
require 'nokogiri'
require 'midiator'

exit if ARGV.size < 1

notemap = { 'div' => C4, 'p' => D4, 'li' => E4 }

doc = Nokogiri::HTML(IO.read(ARGV[0])

#later :/
doc.children.each do

end

