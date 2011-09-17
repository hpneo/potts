class Task < ActiveRecord::Base

  belongs_to :category

  STATUS = {'Aceptada' => 'accepted',
    'Completada' => 'done',
    'Pendiente' => 'pending',
    'No Asignada' => 'unscheduled',
    'Sin Iniciar' => 'unstarted',
    'Enviada' => 'delivered'}

end
