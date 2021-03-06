# frozen_string_literal: true

class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def my
    @badges = current_user.badges
    render :index
  end
end
