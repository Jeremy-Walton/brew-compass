# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    redirect_to brews_path if current_user
  end
end
