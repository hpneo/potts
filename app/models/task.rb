class Task < ActiveRecord::Base

  belongs_to :category

  STATUS = {
    'No Asignada' => 'unscheduled',
    'Sin Iniciar' => 'unstarted',
    'Iniciada' => 'started',
    'Terminada' => 'finished',
    'Enviada' => 'delivered',
    'Aceptada' => 'accepted',
    'Rechazada' => 'rejected'}

  def story_url
    "https://www.pivotaltracker.com/story/show/#{self.story_id}"
  end

  def post_to_pivotal
    params = {:name => self.title,
      :project_id => self.category.project_id,
      :description => self.comments,
      :current_state => self.status}
    story = Story.create(params)
    self.story_id = story.id
    self.save
  end

end
