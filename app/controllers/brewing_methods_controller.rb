# frozen_string_literal: true

class BrewingMethodsController < ApplicationController
  def index
    # @brewing_methods = current_user.brewing_methods
    @brewing_methods = BrewingMethod.all
  end

  def new
    # @brewing_method = current_user.brewing_methods.build
    @brewing_method = BrewingMethod.new

    render layout: 'modal'
  end

  def edit
    # @brewing_method = current_user.brewing_methods.find(params[:id])
    @brewing_method = BrewingMethod.find(params[:id])

    render layout: 'modal'
  end

  def create
    # @brewing_method = current_user.brewing_methods.new(brewing_method_params)
    @brewing_method = BrewingMethod.new(brewing_method_params)

    if @brewing_method.save
      redirect_to brewing_methods_path, notice: 'Brewing Method was successfully created.'
    else
      render :new, layout: 'modal', status: :unprocessable_entity
    end
  end

  def update
    # @brewing_method = current_user.brewing_methods.find(params[:id])
    @brewing_method = BrewingMethod.find(params[:id])

    if @brewing_method.update(brewing_method_params)
      redirect_to brewing_methods_path, notice: 'Brewing Method was successfully updated.'
    else
      render :edit, layout: 'modal', status: :unprocessable_entity
    end
  end

  def destroy
    @brewing_method = BrewingMethod.find(params[:id])
    @brewing_method.destroy

    redirect_to brewing_methods_path, notice: 'Brewing Method was successfully deleted.'
  end

  private

  def brewing_method_params
    params.expect(brewing_method: %i[name prep_type])
  end
end
