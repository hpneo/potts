class Project < ActiveResource::Base

  self.site = "http://www.pivotaltracker.com/services/v3"
  self.headers['X-TrackerToken'] = '3fa226bc048021e8467040561f403381'

end