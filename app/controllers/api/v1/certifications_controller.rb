module Api
  module v1
    class CertificationsController < BaseController
      def create
        profile = Member.find(params[:profile_id])

        unless profile.id == current_member.id
          return render json: {
            error: "forbidden"
          }, status: :forbidden
        end

        certification = profile.certifications.new(
          certification_params.merge(
            tenant_id: current_member.tenant_id
          )
        )

        if certification.save
          render json: certification,
                status: :created
        else
          render json: {
            errors: certification.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      private

      def certification_params
        params.permit(:name, :issued_at)
      end
    end
  end
end