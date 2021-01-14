feature 'pg'

feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'user clicks view button to view bookmarks' do
  
    Bookmark.create(url: 'http://www.makersacademy.com')
    Bookmark.create(url: 'http://www.twitter.com')
    Bookmark.create(url: 'http://www.google.com')


    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.twitter.com"
    expect(page).to have_content "http://www.google.com"
  end
end