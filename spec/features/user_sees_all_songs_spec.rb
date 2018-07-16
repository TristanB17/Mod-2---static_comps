require 'rails_helper'

describe 'user_index' do
  it 'user can see all songs' do
    artist = Artist.create(name: 'Adele')
    song_1 = Song.create(title: "Don't Stop Believin'", length: 303, play_count: 123456, artist_id: artist.id)
    song_2 = artist.songs.create(title: "Never Gonna Give You Up", length: 253, play_count: 98765432)

    visit songs_path

    expect(page).to have_content("All Songs")
    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end
end
