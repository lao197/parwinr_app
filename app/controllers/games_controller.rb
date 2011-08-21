class GamesController < ApplicationController
  before_filter :authenticate, :only => [:new, :create]
  
  @game_session = 0
  
  def create()
    
# Game: video_id, user_id
# Question: question, options, answer
# Video: video_id, type
#    @game = current_user().games.build(params[:game])
#   Look for video in the database first, create an entry if not found
#    videoId = params[:video][:video_id]
#    @video = Videos.find_by_video_id(videoId)
#    if @video.nil?
#      @video = Video.new(:video_id => params[:video], :type => "ytId")
#      if !@video.save
##        error handling, but unlikely
#      end
#    end
#    @game.video_id = videoId
#    @question = @game.build(
    


#    if @micropost.save
#      flash[:success] = "Micropost created!"
#      redirect_to root_path
#    else
#      @feed_items = []
#      render 'pages/home'
#    end

    @title = "Create a New Game"
    @game = current_user().games.build(:video_id => "1")
    if @game.nil?
      render 'new'
    else
      @question = @game.questions.build(params[:question])
      if @question.save
        @game.game_questions.create(:question_id => question.id);
        render 'show'
      else
        render 'new'
      end
    end
   
  end
  
  def show()
    @title = "Play Game"
  end

  def index()
    @title = "Browse Games"
    # @category = params[:category]
  end
  
  def new()
    @title = "Create a New Game"
    @question = Question.new
    @game = current_user().games.build(:video_id => "1")
  end
end
