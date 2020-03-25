# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    render json: { tests: Test.all }
  end

  def show
    render json: { tests: Test.where(id: params[:id]) }
  end
end
