module RushImporter
  def self.import(json_path)
    file = File.read(json_path)
    JSON.parse(file).each do |data|
      rush = Rush.new
      Rush::NAME_ATTR_PAIRS.each { |(name, attr)| rush[attr] = data[name] }
      rush.save!
    end
  end
end
