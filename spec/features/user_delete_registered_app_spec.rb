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
    fill_in 'Name', with: 'Spec Test'
    fill_in 'Url', with: 'http://test.com'
    click_button 'Save'
    click_link 'Spec Test'
  end
  
  scenario 'successfully' do
    click_link 'Delete'
    
    expect(page).to have_content('Spec Test was deleted successfully.')
    expect(RegisteredApplication.count) == nil
  end
end