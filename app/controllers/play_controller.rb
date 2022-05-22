class PlayController < ApplicationController
  require 'httparty'

  before_action do
    @defeat = {Rock: :Scissors, Paper: :Rock, Scissors: :Paper}
    @throws = @defeat.keys
    @player_choice = params[:choice]&.to_sym
    @server_choice = get_server_choice&.to_sym
    @result = { title: 'Choose Your Throw' }
  end

  def choose
    if params[:choice]
      determine_winner
    end
  end

  private
    def get_server_choice
      result = AppServices::ApiaryThrow.new.call
    end

    def determine_winner
      if @player_choice == @server_choice
        @result = { title: "It's a Draw!" }
      elsif @server_choice == @defeat[@player_choice]
        @result = { title: "You Win!", body: "Player wins with #{@player_choice} (vs #{@server_choice})", choice: @player_choice }
      else
        @result = { title: "You Lose!", body: "Server wins with #{@server_choice} (vs #{@player_choice})" , choice: @server_choice }
      end
    end
end
