# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def brew
    render layout: 'modal'
  end
end
