class UpvotesController < ApplicationController
  # GET /upvotes
  # GET /upvotes.json
  def index
    @upvotes = Upvote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @upvotes }
    end
  end

  # GET /upvotes/1
  # GET /upvotes/1.json
  def show
    @upvote = Upvote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upvote }
    end
  end

  # GET /upvotes/new
  # GET /upvotes/new.json
  def new
    @upvote = Upvote.new
    @upvote.user_id = current_user.id
    @upvote.pitch_id = params[:pitch]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upvote }
    end
  end

  # GET /upvotes/1/edit
  def edit
    @upvote = Upvote.find(params[:id])
  end

  # POST /upvotes
  # POST /upvotes.json
  def create
    @upvote = Upvote.new(params[:upvote])

    respond_to do |format|
      if @upvote.save
        format.html { redirect_to @upvote, notice: 'Upvote was successfully created.' }
        format.json { render json: @upvote, status: :created, location: @upvote }
      else
        format.html { render action: "new" }
        format.json { render json: @upvote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /upvotes/1
  # PUT /upvotes/1.json
  def update
    @upvote = Upvote.find(params[:id])

    respond_to do |format|
      if @upvote.update_attributes(params[:upvote])
        format.html { redirect_to @upvote, notice: 'Upvote was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @upvote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upvotes/1
  # DELETE /upvotes/1.json
  def destroy
    @upvote = Upvote.find(params[:id])
    @upvote.destroy

    respond_to do |format|
      format.html { redirect_to upvotes_url }
      format.json { head :ok }
    end
  end
end
