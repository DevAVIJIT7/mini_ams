module Api
  module v1
    class BaseController < ActionController::API
      before_action :doorkeeper_authorize!
      before_action :validate_tenant!

      private

      def current_member
        @current_member ||= Member.find(
          doorkeeper_token.resource_owner_id
        )
      end

      def validate_tenant!
        tenant = request.headers["x-tenant"]

        unless tenant.present? &&
              tenant == current_member.tenant_id
          render json: {
            error: "invalid_tenant"
          }, status: :forbidden
        end
      end
    end
  end
end