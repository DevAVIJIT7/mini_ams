module Api
  module v1
    class CertificationActivitiesController < BaseController
      def create
        certification = current_member.certifications.find(
          params[:certification_id]
        )

        activity = certification.certification_activities.new(
          activity_params
        )

        if activity.save
          render json: activity, status: :created
        else
          render json: {
            errors: activity.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      private

      def activity_params
        params.permit(
          :credit_type_id,
          :amount,
          :description,
          :occurred_on
        )
      end
    end
  end
end