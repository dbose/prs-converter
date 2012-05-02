class Processor
  def self.process(filename, dirname)

  # Get file details
  basename = File.basename(filename, ".note")
  directory = dirname
  file = File.read(filename)

  # Parse and Build
  reader = NoteReader.new(file)
  reader.parse
  builder = NoteWriter.new(reader.svg_root, reader.root_namespaces)
  content = builder.writable_content
  write_filename = File.join(directory, "#{basename}.svg")
  File.open(write_filename, 'w') { |f| f.write(content) }

  puts "#{write_filename} is generated successfully"

  end

end