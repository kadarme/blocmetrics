require 'rails_helper'

feature 'user adds registered application' do
  
  before do
    @user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
    click_link 'My Registered Applications'
    click_link 'Add application'
  end
  
  scenario 'successfully' do
    fill_in 'Name', with: 'Example'
    fill_in 'Url', with: 'http://example.com'
    click_button 'Save'
    
    expect(page).to have_content('Example')
    expect(page).to have_content('http://example.com')
  end
  
  scenario 'unsuccessfully with no name' do
    fill_in 'Name', with: ''
    fill_in 'Url', with: 'http://noname.com'
    click_button 'Save'
    
    expect(page).to have_content('Error creating application. Please try again.')
  end
  
  scenario 'unsuccessfully with no url' do
    fill_in 'Name', with: 'Name'
    fill_in 'Url', with: ''
    click_button 'Save'
    
    expect(page).to have_content('Error creating application. Please try again.')
  end
end