require 'rails_helper'

module OpenStax
  module Biglearn
    module V1
      RSpec.describe FakeClient, type: :external do

        subject { described_class.instance }

        it_behaves_like "biglearn client api v1"

      end
    end
  end
end