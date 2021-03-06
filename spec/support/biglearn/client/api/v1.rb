require 'spec_helper'

RSpec.shared_examples "biglearn client api v1" do

    let!(:exercise_activity) { FactoryGirl.create :exercise_activity }
    let!(:identifier)        { exercise_activity.task.identifier }

    context "send_learner" do
      let!(:platform_learner_id) { identifier.read_access_token.token }
      let!(:analysis_id)         { identifier.analysis_uid }

      it "works when the input validates against the schema" do
        response = subject.send_learner(
          platform_learner_id: platform_learner_id,
          analysis_id: analysis_id
        )

        expect(response['message']).to eq("Learners saved.")
      end

      it "fails when the input does not validate against the schema" do
        response = nil
        expect {
          response = subject.send_learner(
            platform_learner_id: platform_learner_id,
            analysis_id: nil
          )
        }.to raise_error

        expect(response).to be_blank
      end
    end

    context "send_response" do
      let!(:learner_id)  { identifier.read_access_token.token }
      let!(:question_id) { exercise_activity.task.resource.url }
      let!(:score)       { exercise_activity.grade }
      let!(:activity_id) { exercise_activity.id.to_s }
      let!(:timestamp)   { DateTimeUtilities.to_api_s(exercise_activity.updated_at) }

      it "works when the input validates against the schema" do
        response = subject.send_response(
          learner_id: learner_id,
          question_id: question_id,
          score: score,
          activity_id: activity_id,
          timestamp: timestamp
        )

        expect(response['message']).to eq("Response saved.")
      end

      it "fails when the input does not validate against the schema" do
        response = nil
        expect {
          response = subject.send_response(
            learner_id: learner_id,
            question_id: question_id,
            score: -1,
            activity_id: activity_id,
            timestamp: timestamp
          )
        }.to raise_error

        expect(response).to be_blank
      end
    end

end
