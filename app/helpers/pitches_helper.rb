module PitchesHelper
  def upvote_pitch(pitch)
    @upvote = Upvote.new
    @upvote.user_id = current_user.id
    @upvote.pitch_id = pitch.id
    if @upvote.save
     flash.now[:notice] = 'Upvote was successfully created.'
    end
  end
end