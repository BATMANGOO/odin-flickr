require 'flickr'
class StaticPagesController < ApplicationController
  before_action :set_static_page, only: %i[ show edit update destroy ]

  # GET /static_pages or /static_pages.json
  def index
    flickr = Flickr.new "be0fb3dc27fdb968ab8084518703173d", ENV['FLICKR_SECRET']

    if params[:user_id].blank?
      @photos = flickr.photos.getRecent
    else
      @photos = flickr.photos.search(user_id: params[:user_id])
    end

    respond_to do |format|
      format.html
      format.json { render json: @photos }
    end
  end
end
