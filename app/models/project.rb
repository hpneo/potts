class Project < ActiveResource::Base

  self.site = "https://www.pivotaltracker.com/services/v3"
  self.headers['X-TrackerToken'] = '3fa226bc048021e8467040561f403381'

  def stories
    Story.where(:project_id => self.id)
  end
  
end