require 'pry'

class Artist
    attr_accessor :name

    def initialize(name)
        @name = name
    end


    def songs
       Song.all.filter do |song|
            self == song.artist
       end
    end


    def add_song(song)
        song.artist = self
    end


    def add_song_by_name(song_name)
       new_song = Song.new(song_name)
       add_song(new_song)
    end


    def self.song_count
       songs_with_artist = Song.all.filter do |song|
            song.artist
        end
        songs_with_artist.length
    end
end

