require 'note-reader'
require 'note-writer'
require 'processor'

dirname = ARGV[0]
if (not File.directory?(dirname))
  raise "Invalid directory !!!"
end

count = 0
Dir.glob(File.join(dirname, "*.note")) do |file|
  count = count + 1
  puts "Processing file - #{file} ..."
  Processor.process(file, dirname)
end

puts "No .note files found" if count == 0
