class Story
  include HappyMapper

  tag 'story'

  element :id, Integer
  element :url, String
  element :created_at, DateTime
  element :accepted_at, DateTime
  element :project_id, Integer

  element :name, String
  element :description, String
  element :story_type, String
  element :estimate, Integer
  element :current_state, String
  element :requested_by, String
  element :owned_by, String
  element :labels, String
  element :jira_id, Integer
  element :jira_url, String
  element :other_id, Integer
  element :integration_id, Integer
  element :deadline, DateTime

  def self.find(id)
    story = Story.new
    story.id = id
    story
  end

  def self.where(options)
    client = RestClient::Resource.new("https://www.pivotaltracker.com/services/v3/projects/#{options[:project_id]}/stories", :headers => {'X-TrackerToken' => '3fa226bc048021e8467040561f403381', 'Content-Type' => 'application/xml'})
    parse(client.get)
  end

  def self.create(options)
    client = RestClient::Resource.new("https://www.pivotaltracker.com/services/v3/projects/#{options[:project_id]}/stories", :headers => {'X-TrackerToken' => '3fa226bc048021e8467040561f403381', 'Content-Type' => 'application/xml'})
    body = Story.build_body(options)
    response = client.post "<story>#{body}</story>"
    parse(response)
  end

  def update_attributes(options)
    #por ahora, se tiene que pasar el project_id (U)
    puts self.inspect
    client = RestClient::Resource.new("https://www.pivotaltracker.com/services/v3/projects/#{options[:project_id]}/stories/#{self.id}", :headers => {'X-TrackerToken' => '3fa226bc048021e8467040561f403381', 'Content-Type' => 'application/xml'})
    body = Story.build_body(options)
    response = client.put "<story>#{body}</story>"
    Story.parse(response)
  end

  def destroy(options)
    #por ahora, se tiene que pasar el project_id (U)
    client = RestClient::Resource.new("https://www.pivotaltracker.com/services/v3/projects/#{options[:project_id]}/stories/#{self.id}", :headers => {'X-TrackerToken' => '3fa226bc048021e8467040561f403381', 'Content-Type' => 'application/xml'})
    body = Story.build_body(options)
    response = client.delete
    Story.parse(response)
  end

  private
    def self.build_body(options)
      body = ""
      options.each { |key, value|
        body << "<#{key}>#{value.encode('UTF-8')}</#{key}>"
      }
      body
    end

end