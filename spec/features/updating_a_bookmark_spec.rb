feature 'Updating a bookmark' do
  scenario 'updates bookmark title and link' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: 'https://www.apple.com')
    fill_in('title', with: 'Apple')
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Apple', href: 'https://www.apple.com') 

  end
end