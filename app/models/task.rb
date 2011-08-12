class Task < ActiveRecord::Base

  belongs_to :category

  STATUS = {:Completada => 'done', :Pendiente => 'pending'}

end
