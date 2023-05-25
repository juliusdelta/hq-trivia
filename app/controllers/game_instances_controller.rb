# frozen_string_literal: true

class GameInstancesController < ApplicationController
  before_action :authenticate_user!

  def join
    game_instance = GameInstance.find(params[:id])

    if current_user.join_with_session_for(game_instance)
      redirect_to game_instance_path(game_instance.id)
    else
      flash[:alert] = 'Looks like you are already apart of a game!' # rubocop:disable Rails/I18nLocaleTexts
      redirect_to root_path
    end
  end

  def show
    @game_instance = GameInstance.find(params[:id])
  end
end
