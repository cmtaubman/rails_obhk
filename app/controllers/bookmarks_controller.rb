class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

# Have to work out if below is correct - may not even need this bookmarks controller to be honest....
# GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully created.' }
        format.json { render :index, status: :created, location: @bookmark }
      else
        format.html { render :index }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end
end
