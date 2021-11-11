require 'flickr'
class StaticPagesController < ApplicationController
  before_action :set_static_page, only: %i[ show edit update destroy ]

  # GET /static_pages or /static_pages.json
  def index
    flickr = Flickr.new "be0fb3dc27fdb968ab8084518703173d", "c74b9823029ff5f7"

    if params[:user_id].blank?
      @photos = flickr.photos.getRecent
    else
      @photos = flickr.photos.search(user_id: params[:user_id])
    end
  end
end
