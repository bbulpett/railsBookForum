require 'spec_helper'

describe 'home page' do
  it 'page should load' do
    visit '/'
    page.should have_content('Learning Rails 5')
  end
end

# describe 'forums page' do
#   it 'page should load' do
#     visit '/forums'
#     page.should have_content('Forums')
#   end
# end

describe 'screencasts page' do
  it 'page should load' do
    visit '/screencasts'
    page.should have_content('screencasts to accompany and expand upon ')
  end
end

