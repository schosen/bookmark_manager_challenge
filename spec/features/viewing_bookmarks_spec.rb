feature 'pg'

feature 'viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    


  end
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'user clicks view button to view bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.twitter.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")


    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.twitter.com"
    expect(page).to have_content "http://www.google.com"
  end
end