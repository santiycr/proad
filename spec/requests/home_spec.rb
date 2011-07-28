require 'spec_helper'
 
describe 'home page', :js => true do
  it 'welcomes the user' do
    visit '/'
    page.should have_content('Google.com.ar')
  end
end

