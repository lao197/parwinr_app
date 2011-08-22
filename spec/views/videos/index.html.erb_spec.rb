require 'spec_helper'

describe "videos/index.html.erb" do
  before(:each) do
    assign(:videos, [
      stub_model(Video,
        :videoID => "Video",
        :type => "Type"
      ),
      stub_model(Video,
        :videoID => "Video",
        :type => "Type"
      )
    ])
  end

  it "renders a list of videos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Video".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
