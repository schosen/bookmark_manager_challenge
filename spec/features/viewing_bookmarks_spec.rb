feature 'pg'

feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'user clicks view button to view bookmarks' do
  
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.twitter.com', title: 'Twitter')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')


    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com') 
    expect(page).to have_link('Twitter', href: 'http://www.twitter.com') 
    expect(page).to have_link('Google', href: 'http://www.google.com') 
  end
end