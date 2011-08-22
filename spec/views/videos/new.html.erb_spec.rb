require 'spec_helper'

describe "videos/new.html.erb" do
  before(:each) do
    assign(:video, stub_model(Video,
      :videoID => "MyString",
      :type => "MyString"
    ).as_new_record)
  end

  it "renders new video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => videos_path, :method => "post" do
      assert_select "input#video_videoID", :name => "video[videoID]"
      assert_select "input#video_type", :name => "video[type]"
    end
  end
end
