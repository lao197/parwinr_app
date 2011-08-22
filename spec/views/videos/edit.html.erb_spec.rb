require 'spec_helper'

describe "videos/edit.html.erb" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :videoID => "MyString",
      :type => "MyString"
    ))
  end

  it "renders the edit video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => videos_path(@video), :method => "post" do
      assert_select "input#video_videoID", :name => "video[videoID]"
      assert_select "input#video_type", :name => "video[type]"
    end
  end
end
