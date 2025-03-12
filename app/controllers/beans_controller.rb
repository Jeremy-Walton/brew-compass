# frozen_string_literal: true

class BeansController < ApplicationController
  def index
    # @beans = current_user.beans
    @beans = Bean.all
  end

  def new
    # @bean = current_user.beans.build
    @bean = Bean.new

    render layout: 'modal'
  end

  def edit
    @bean = Bean.find(params[:id])

    render layout: 'modal'
  end

  def create
    @bean = Bean.new(bean_params)

    if @bean.save
      redirect_to beans_path, notice: 'Bean was successfully created.'
    else
      render :new, layout: 'modal', status: :unprocessable_entity
    end
  end

  def update
    @bean = Bean.find(params[:id])

    if @bean.update(bean_params)
      redirect_to beans_path, notice: 'Bean was successfully updated.'
    else
      render :edit, layout: 'modal', status: :unprocessable_entity
    end
  end

  private

  def bean_params
    params.expect(bean: %i[name roaster roast_date taste_profile decaf notes])
  end
end
