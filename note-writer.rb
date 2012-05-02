
# Parse a .note file

require 'rubygems'
require 'nokogiri'


class NoteWriter

  def initialize(svg_node, namespaces = {})
    @svg_root = svg_node
    @namespaces = namespaces
    @namespaces['xmlns:xml'] = 'http://www.w3.org/XML/1998/namespace'
    @namespaces['transform']=''
  end

  def writable_content
    builder = Nokogiri::XML::Builder.new { |xml|

              xml.svg(@namespaces) do

                xml << @svg_root.to_xml

              end
    }
    builder.to_xml
  end

end