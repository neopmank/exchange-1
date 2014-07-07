module EventRest
  protected

  def get_resource(klass)
    app = current_application
    return nil unless app
    platform = Platform.for(app)
    Resource.find_or_create(platform, params[:resource])
  end

  def event_create(klass, represent_with = nil, &block)
    standard_create(klass, represent_with) do |event|
      event.person_id = doorkeeper_token.resource_owner_id
      event.resource = get_resource(klass)
      event.occurred_at = params[:occurred_at] || Time.now
      block.call(event) if block
    end
  end
end
