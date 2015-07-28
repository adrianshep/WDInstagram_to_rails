class EntriesController < ApplicationController
  # index
  def index
    @entries = Entry.all.order(:id).reverse
  end

  # show
  def show
    @entry = Entry.find( params[:id] )
  end

# new
  def new
    @entry = Entry.new
  end

# create
  def create
    @entry = Entry.new( params[:entry] )
    @entry.update( date_taken: Time.now.strftime("%B %d, %Y") )
    if @entry.save
      redirect "/entries/#{@entry.id}"
    else
      redirect "/posts/new"
    end
  end

# edit
  def edit
    @entry = Entry.find( params[:id] )
  end

# update
  def update
    @entry = Entry.find( params[:id] )
    @entry.update( params[:entry] )
    redirect "/entries/#{@entry.id}"
  end

# delete
  def destroy
    @entry = Entry.find( params[:id] )
    @entry.destroy
  redirect "/"
  end
end
