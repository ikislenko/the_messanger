require "rails_helper"

RSpec.describe CommentsController, :type => :controller do
  let(:user) { create(:user) }
  let(:current_user) {user}

  describe "COMMENT '/comments'" do
    before do
      allow(controller).to receive(:current_user) { user }
    end

    it "should create comment" do
      message = create(:post)
      post :create, post_id: message.id, comment: {content: "test"}
      expect(response).to redirect_to post_path(message)
    end

    it "should update comment" do
      message = create(:post)
      post :create, post_id: message.id, comment: {content: "test"}
      comment = Comment.first
      comment.content.should eq('test')

      put :update, post_id: message.id, id: comment.id, comment: {content: "content test"}

      comment = Comment.first
      comment.content.should eq('content test')
      expect(response).to redirect_to post_path(message)
    end

    it "should delete comment" do
      message = create(:post)
      post :create, post_id: message.id, comment: {content: "test"}

      post :destroy,  post_id: message.id, id: message.id
      expect(response).to redirect_to post_path(message)
    end
  end
end
