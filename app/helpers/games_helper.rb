module GamesHelper
  def startCreating(game)
    @gameBeingCreated = game
  end
  
  def isCreatingGame?
    @gameBeingCreated.nil?
  end
  
  def finished()
    @gameBeingCreate = nil
  end
  
end
