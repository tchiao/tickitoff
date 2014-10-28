require 'rails_helper'

feature 'Project manager creates task' do
  scenario 'Successfully' do
    visit new_task_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect(page).to have_content("Your new task was saved!")
    expect(page).to have_content("Meet up with the team")
  end

  scenario 'Without description' do
    visit new_task_path
    click_button 'Save'
    expect(page).to have_content("Sorry, there was a problem saving your task.")
    expect(page).to have_content("Description can't be blank")
  end
end
