class PitchesController < ApplicationController
  # GET /pitches
  # GET /pitches.json
  def index
    @pitches = Pitch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pitches }
    end
  end

  # GET /pitches/1
  # GET /pitches/1.json
  def show
    @pitch = Pitch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pitch }
    end
  end

  # GET /pitches/new
  # GET /pitches/new.json
  def new
    @pitch = Pitch.new
    @pitch.public_visible = true

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pitch }
    end
  end

  # GET /pitches/1/edit
  def edit
    @pitch = Pitch.find(params[:id])
  end
  
  def upvote
    if current_user
      @upvote = Upvote.new
      @upvote.user_id = current_user.id
      @upvote.pitch_id = params[:id]
      if @upvote.save
       flash.now[:notice] = 'Upvote was successfully created.'
       redirect_to pitches_path
      end
      redirect_to pitches_path, notice: 'Bro, you best log in first'
    end
  end

  # POST /pitches
  # POST /pitches.json
  def create
    if current_user
      @pitch = Pitch.new(params[:pitch])
      @pitch.user_id = current_user.id
  
      respond_to do |format|
        if @pitch.save
          format.html { redirect_to @pitch, notice: 'Pitch was successfully created.' }
          format.json { render json: @pitch, status: :created, location: @pitch }
        else
          format.html { render action: "new" }
          format.json { render json: @pitch.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to pitches_path, notice: 'Y U NO LOGIN?!'
    end
  end

  # PUT /pitches/1
  # PUT /pitches/1.json
  def update
    @pitch = Pitch.find(params[:id])

    respond_to do |format|
      if @pitch.update_attributes(params[:pitch])
        format.html { redirect_to @pitch, notice: 'Pitch was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pitch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pitches/1
  # DELETE /pitches/1.json
  def destroy
    @pitch = Pitch.find(params[:id])
    @pitch.destroy

    respond_to do |format|
      format.html { redirect_to pitches_url }
      format.json { head :ok }
    end
  end
end
