class PlayController < ApplicationController
  def choose
    @choices = %w(rock paper scissors)
  end
end
