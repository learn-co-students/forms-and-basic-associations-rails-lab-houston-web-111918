class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    
  end

  def artist_name
     self.artist ? self.artist.name : nil
    #  self.try(:artist).try(:name)
    end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
    # self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    # byebug
    self.genre ? self.genre.name : nil
    # self.try(:genre).try(:name)
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
  
end
