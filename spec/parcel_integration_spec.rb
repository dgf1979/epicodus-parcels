require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Parcel Integration Testing', {:type => :feature}) do
  #framework test
  it('verifies a test route is getting to its target view') do
    visit('/')
    expect(page).to have_content('Parcel Service')
  end

  #verify integration of parcel shipping cost
  it('verifies expected cost for a given package size and weight') do
    visit('/')
    fill_in('length', :with => 4)
    fill_in('width', :with => 4)
    fill_in('height', :with => 4)
    fill_in('weight', :with => 20)
    click_button('Send')
    expect(page).to have_content('20.00')
  end

  #verify integration of parcel shipping cost
  it('verifies feature additions (giftwrap, international, priority)') do
    visit('/')
    fill_in('length', :with => 4)
    fill_in('width', :with => 4)
    fill_in('height', :with => 4)
    fill_in('weight', :with => 20)
    check('gift_wrap')
    select('Overnight', :from => 'priority')
    check('destination')
    click_button('Send')
    expect(page).to have_content('89.60')
  end

end
