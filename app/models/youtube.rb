#############################################################
# 
# Youtube Video Puller for Startup Tribe
#
#############################################################

# A small class to memoize Youtube lookups
class YoutubeVideo < ActiveRecord::Base
	attr_reader :id, :embed, :length
	def initiate(id, date, title, embed_url, length)
		@id=id
		@date=date
		@title=title
		@embed_url=embed_url
		@length=length
	end
end

# The scraper
class YoutubeGetter < Youtube::Youtube_it
	def initiate
		@youtube = YoutubeIt::Client.new
	end
	def maybe_create? (video)
		unless YoutubeVideo.find(vid.video_id) or vid.racy or vid.noembed
			YoutubeVideo(vid.video_id, vid.published_at, vid.title, vid.embed_url, vid.duration)
		end
	end
	def verify ( video_id )
		vids = youtube.videos_by(video_id).videos
		if vids.length == 1
			maybe_create? vids[0]
		end
	end
	def search ( tags = [ "my-awesome-tribe-pitch"] )
		found = []
		done? = false
		while not done?
			youtube.videos_by(:tags => tags).videos.each
			{|vid| 
			   value = maybe_create? vid
				if value
					found.push value
				else
					done? = true
					break
				end}
		end
		found
	end
	def latest(n)
		YoutubeVideo.order("date").limit(n)
	end
end
