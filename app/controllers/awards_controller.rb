class AwardsController < ApplicationController
  def index
  end

  def archive
    @award = Award.find_by_year params[:id]
  end

  def organizers
  end

  def nominees
  end
end