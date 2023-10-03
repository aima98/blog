require 'rails_helper'

RSpec.feature 'User Index', type: :feature do
  scenario 'visiting the user index page' do
    User.create(name: 'Kante', photo: 'https://unsplash.com/photos/OgqWLzWRSaI')
    User.create(name: 'Hazard', photo: 'https://unsplash.com/photos/OgqWLzWRSaI')

    visit users_path

    expect(page).to have_content('Kante')
    expect(page).to have_content('Hazard')
    expect(page).to have_selector('img[src="https://unsplash.com/photos/OgqWLzWRSaI"]',
                                  count: 2)
  end

  scenario 'visiting the user index page, you see the number of posts each user has written..' do
    user1 = User.create(name: 'Kante')
    User.create(name: 'Hazard')
    Post.create(author: user1, title: 'first post')
    Post.create(author: user1, title: 'second post')
    Post.create(author: user1, title: 'third post')

    visit users_path

    expect(page).to have_content('3')
    expect(page).to have_content('0')
  end

  scenario 'clicking on a user redirects to their show page' do
    user = User.create(name: 'Tuchel')

    visit users_path

    click_link 'Tuchel'

    expect(page).to have_current_path(user_path(user))
  end
end
