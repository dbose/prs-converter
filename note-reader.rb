# Parse a .note file

require 'rubygems'
require 'nokogiri'

class NoteReader

  attr_reader :svg_root
  attr_reader :root_namespaces


  def initialize(xml)
    @original_content = xml
  end

  def parse
    doc = Nokogiri::XML(@original_content)
    @svg_root = doc.xpath("//note:notepad/note:drawing/note:page/xs1:svg",
                          { 'note' => 'http://www.sony.com/notepad',
                            'xs1' => 'http://www.w3.org/2000/svg' }).children
    @root_namespaces = doc.root.namespaces
  end
end