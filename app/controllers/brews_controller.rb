# frozen_string_literal: true

class BrewsController < ApplicationController
  def index
    # @brews = current_user.brews
    @brews = Brew.all
  end

  def new
    # @brew = current_user.brews.build
    @brew = Brew.new

    render layout: 'modal'
  end

  def edit
    # @brew = current_user.brews.find(params[:id])
    @brew = Brew.find(params[:id])

    render layout: 'modal'
  end

  def create
    # @brew = current_user.brews.new(brew_params)
    @brew = Brew.new(brew_params)

    if @brew.save
      redirect_to brews_path, notice: 'Brew was successfully created.'
    else
      render :new, layout: 'modal', status: :unprocessable_entity
    end
  end

  def update
    # @brew = current_user.brews.find(params[:id])
    @brew = Brew.find(params[:id])

    if @brew.update(brew_params)
      redirect_to brews_path, notice: 'Brew was successfully updated.'
    else
      render :edit, layout: 'modal', status: :unprocessable_entity
    end
  end

  def destroy
    # @brew = current_user.brews.find(params[:id])
    @brew = Brew.find(params[:id])
    @brew.destroy

    redirect_to brews_path, notice: 'Brew was successfully deleted.'
  end

  private

  def brew_params
    params.expect(brew: %i[bean_id brewing_method_id rating])
  end
end
