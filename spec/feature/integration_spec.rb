# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Shikhar Baheti'
    fill_in 'Price', with: 20
    select '2021', :from => 'book_published_1i'
    select 'September', :from => 'book_published_2i'
    select '30', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end

  scenario 'invalid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Shikhar Baheti'
    click_on 'Create Book'
    expect(page).to have_content("Price can't be blank")
  end
end

RSpec.describe 'Deleting a book', type: :feature do
  scenario 'Create and then delete a book' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Shikhar Baheti'
    fill_in 'Price', with: 20
    select '2021', :from => 'book_published_1i'
    select 'September', :from => 'book_published_2i'
    select '30', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
    click_on 'Delete'
    click_on 'Delete'
    visit root_path
    expect(page).not_to have_content('harry potter')
  end
end

RSpec.describe 'Editing a book', type: :feature do
  scenario 'Edit a book and then edit it' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Shikhar Baheti'
    fill_in 'Price', with: 20
    select '2021', :from => 'book_published_1i'
    select 'September', :from => 'book_published_2i'
    select '30', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
    click_on 'Edit'
    fill_in 'Title', with: 'A great book'
    click_on 'Update Book'
    visit root_path
    expect(page).to have_content("A great book")
  end
end