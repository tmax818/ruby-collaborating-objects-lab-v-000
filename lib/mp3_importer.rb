
class MP3Importer 
  
  attr_accessor :path, :files, :import 
  
  def initialize(filepath)
    @path = filepath            
  end
  
  def files
    @files = Dir.entries(@path)                             #also could use Dir.glob("#{path}/*.mp3").map {|file| file.gsub("#{path}/', "") }
    @files.delete_if {|file| file == "." || file == ".." }
  end 
  
  def import
    self.files.each do |file|
      song = Song.new_by_filename(file)
      Artist.all << song.artist unless Artist.all.include?(song.artist)
    end 
  end 
  
end