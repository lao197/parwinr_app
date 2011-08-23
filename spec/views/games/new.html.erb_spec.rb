require 'spec_helper'

describe "games/new.html.erb" do
  before(:each) do
    assign(:game, stub_model(Game,
      :title => "MyString",
      :description => "MyString",
      :rating => 1.5,
      :totalRating => 1,
      :noOfRating => 1,
      :likes => 1
    ).as_new_record)
  end

  it "renders new game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => games_path, :method => "post" do
      assert_select "input#game_title", :name => "game[title]"
      assert_select "input#game_description", :name => "game[description]"
      assert_select "input#game_rating", :name => "game[rating]"
      assert_select "input#game_totalRating", :name => "game[totalRating]"
      assert_select "input#game_noOfRating", :name => "game[noOfRating]"
      assert_select "input#game_likes", :name => "game[likes]"
    end
  end
end
