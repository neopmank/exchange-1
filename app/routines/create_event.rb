class CreateEvent

  TASK_OPTIONS = [:identifier, :identifier_id, :resource, :resource_id, :trial]

  lev_routine

  uses_routine StandardCreate,
               as: :create,
               translations: { inputs: { scope: :event }, outputs: { map: { object: :event } } }

  uses_routine FindOrCreateTask,
               as: :task,
               translations: { inputs: { type: :verbatim }, outputs: { type: :verbatim } }

  uses_routine ProcessEvent,
               as: :process,
               translations: { inputs: { scope: :activities }, outputs: { type: :verbatim } }

  protected

  def exec(event_class, options = {}, &block)

    options = options.with_indifferent_access
    event_options = options.except(*TASK_OPTIONS)
    task_options = options.slice(*TASK_OPTIONS)
    run(:create, event_class, event_options) do |event|
      event.task = Task.new(task_options)

      block.call(event) unless block.nil?

      # Look for a duplicate Task in the database before saving
      event.task = run(:task, event.task).outputs.task
    end

    run(:process, outputs[:event])

  end

end
