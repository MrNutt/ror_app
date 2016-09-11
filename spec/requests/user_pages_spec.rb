require 'rails_helper'

def full_title(page_title) 
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

describe "User pages" do

subject { page }

	describe "signup page" do
  	before { visit signup_path }

  	it { should have_content('Sign up') }
  	it { should have_title(full_title('Sign up')) }
	end

describe "Profile page" do

let(:user) { FactoryGirl.create(:user) }
  
before { visit user_path(user) }

it { should have_content(user.name) }
it { should have_title(full_title(user.name)) }
end

describe "signup page" do
  before { visit signup_path }

  let(:submit) { "Create my account" }

  describe "valid form" do
    before do
      fill_in "Name",                  with: "Example user"
      fill_in "Email",                 with: "user@example.com"
      fill_in "Password",              with: "foobar"
      fill_in "Confirmation", with: "foobar"
    end

    describe "after saving the user" do
      before { click_button submit }
      let(:user) { User.find_by(email: 'user@example.com') }

      it { should have_link('Sign out') }
      it { should have_title(user.name) }
      #it { should have_css('div.alert.alert-error') } #work on it, ot must work
      it { should have_content('Welcome') }
    end

    it "should create user" do
      expect { click_button submit }.to change {User.count}.by(1)
    end
  end

  describe "not valid form" do
    it "should not create user" do
      expect { click_button submit}.not_to change {User.count}
      expect { should have_title('Sign up') }
      expect { should have_content('error') }
    end
  end
end

end
