class Task < ActiveRecord::Base

  belongs_to :category

  STATUS = {'Aceptada' => 'accepted',
    'Completada' => 'done',
    'Pendiente' => 'pending',
    'No Asignada' => 'unscheduled',
    'Sin Iniciar' => 'unstarted',
    'Enviada' => 'delivered'}

  def story_url
    "https://www.pivotaltracker.com/story/show/#{self.story_id}"
  end

  def post_to_pivotal
    story = Story.create(:name => self.title, :project_id => self.category.project_id, :description => self.comments, :current_state => self.status)
    self.story_id = story.id
    self.save
  end

end
