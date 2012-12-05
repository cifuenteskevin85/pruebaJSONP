class ListsController < ApplicationController
  def index
    @list = List.new
    @incomplete_lists = List.where(check: false)
    @complete_lists = List.where(check: true)
    respond_to do |format|
      format.html
      format.js {render 'widsource'}
    end
  end
  
  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
   @list = List.create!(params[:list])
   respond_to do |format|
      format.js {render jsonp: @list}
   end
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes!(params[:list])
    respond_to do |format|
      format.html { redirect_to lists_url}
      format.js
   end
  end

  def destroy
    @list = List.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to lists_url}
      format.js
   end
  end

end
