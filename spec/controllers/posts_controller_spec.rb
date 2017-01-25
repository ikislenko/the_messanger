require "rails_helper"

RSpec.describe PostsController, :type => :controller do
  let(:user) { create(:user) }
  let(:current_user) {user}

  describe "GET index" do
    it "should return a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "POST new" do
    before do
      allow(controller).to receive(:current_user) { user }
    end

    it "should create post and rediect to posts" do
      post :create, {post: {title: "test", content: "test", user_id: current_user.id}}
      expect(response).to redirect_to posts_path
    end

    it "should update post and rediect to posts" do

      message = create(:post)
      message.content.should eq("test content")
      put :update, {id: message.id, post: {content: "content test"}}

      message = Post.last
      message.content.should eq("content test")

      expect(response).to redirect_to posts_path
    end

    it "should delete post and rediect to posts" do
      message = create(:post)

      post :destroy, {id: message.id}
      expect(response).to redirect_to posts_path
    end
  end
end
