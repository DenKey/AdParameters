# frozen_string_literal: true

require './config/loader'

# As we get configuration from Frontend I assume that all XML files
# will have the same structure. Generally it depends from system architecture.
class XmlParser
  def initialize(path)
    file_path = File.join(Dir.pwd, path)
    file_str = File.read(file_path)
    raise 'XML file cannot be opened or empty' if file_str.nil? || file_str.empty?

    @data = Nokogiri::XML::DocumentFragment.parse(file_str)
  rescue Errno::ENOENT
    raise 'File path is wrong'
  end

  def call
    {
      creatives: build_creatives,
      placements: build_placements
    }
  end

  private

  def build_creatives
    @data.xpath('Creatives//Creative').map do |node|
      Creative.new(id: node.attr('id'),
                   price: node.attr('price'),
                   currency: node.attr('currency'))
    end
  end

  def build_placements
    @data.xpath('Placements//Placement').map do |node|
      Placement.new(id: node.attr('id'),
                    floor: node.attr('floor'),
                    currency: node.attr('currency'))
    end
  end
end
