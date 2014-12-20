require 'rails_helper'

RSpec.describe Event do

  it 'adds event methods to relevant classes' do
    expect(ActiveRecord::Base).to respond_to(:acts_as_event)
    expect(ActiveRecord::ConnectionAdapters::TableDefinition.new(
      {}, :test, true, {})).to respond_to(:event)
    expect(ActiveRecord::Migration.new).to respond_to(:add_event_indices)
    expect(ActionDispatch::Routing::Mapper.new(Exchange::Application.routes)).to(
      respond_to(:event_routes))
  end

  it 'modifies classes that call acts_as_event' do
    heartbeat_event = FactoryGirl.build(:heartbeat_event)
    heartbeat_event.save!
    expect(heartbeat_event.platform).to be_an_instance_of(Platform)
    expect(heartbeat_event.person).to be_an_instance_of(Person)
    expect(heartbeat_event.resource).to be_an_instance_of(Resource)

    heartbeat_event.save!
    [:platform, :person, :resource, :attempt].each do |attr|
      heartbeat_event = FactoryGirl.build(:heartbeat_event)
      heartbeat_event.send("#{attr.to_s}=", nil)
      expect(heartbeat_event.save).to eq(false)
      expect(heartbeat_event.errors.messages).to(
        include(attr => ["can't be blank"])
      )
    end

    heartbeat_event = FactoryGirl.build(:heartbeat_event)
    heartbeat_event.resource.platform = FactoryGirl.create(:platform)
    expect(heartbeat_event.save).to eq(false)
    expect(heartbeat_event.errors.messages).to eq(
      :base => ["Event components refer to different platforms"])
  end

end
