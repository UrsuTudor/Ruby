class Space
  def initialize(player)
    @player = player
    @up = nil
    @down = nil
    @right = nil
    @left = nil
    @upper_left = nil
    @upper_right = nil
    @lower_left = nil
    @lower_right = nil
  end

  attr_reader :player
end
