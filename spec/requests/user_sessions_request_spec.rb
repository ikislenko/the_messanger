require 'rails_helper'

describe "GET '/auth/facebook/callback'" do
  include OmniAuthTestHelper

  before(:each) do
    login
  end

  it "should set user_id" do
    expect(session[:user_id]).to eq(User.last.id)
  end

  it "should redirect to posts" do
    expect(response).to redirect_to posts_path
  end
end

describe "GET '/auth/failure'" do

  it "should redirect to root" do
    get "/auth/failure"
    expect(response).to redirect_to root_path
  end
end
