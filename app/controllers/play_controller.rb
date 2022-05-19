class PlayController < ApplicationController
  require 'httparty'

  before_action do
    @defeat = {Rock: 'Scissors', Paper: 'Rock', Scissors: 'Paper'}
    @throws = @defeat.keys
    @player_choice = params[:choice]
    @server_choice = get_server_choice
    @result = { title: 'Choose Your Throw' }
  end

  def choose
    if params[:choice]
      determine_winner
    end
  end

  private
    def get_server_choice
      result = HTTParty.get("https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw")
      if result['statusCode'] == 200
        result['body']
      else
        ['Paper', 'Rock', 'Scissors'].sample
      end
    end

    def determine_winner
      if @player_choice == @server_choice
        @result = { title: "It's a Draw!" }
      elsif @server_choice == @defeat[@player_choice]
        @result = { title: "You Win!", body: "Player wins with #{@player_choice}", choice: @player_choice }
      else
        @result = { title: "You Lose!", body: "Server wins with #{@server_choice}" , choice: @server_choice }
      end
    end
end
