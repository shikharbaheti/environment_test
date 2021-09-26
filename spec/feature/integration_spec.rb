# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Shikhar Baheti'
    fill_in 'Price', with: 20
    # fill_in 'Published', with: Date.new(2001,2,3)
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end
end