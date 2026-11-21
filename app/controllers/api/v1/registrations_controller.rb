module Api
  module v1
    class RegistrationsController < BaseController
      def index
        member = Member.find(params[:member_id])

        unless member.id == current_member.id
          return render json: {
            error: "forbidden"
          }, status: :forbidden
        end

        registrations = member.registrations
          .includes(:event)
          .where(events: { tenant_id: request.headers["x-tenant"] })

        render json: registrations.map { |registration|
          {
            id: registration.id,
            status: registration.status,
            event: {
              id: registration.event.id,
              title: registration.event.title,
              starts_at: registration.event.starts_at,
              ends_at: registration.event.ends_at
            }
          }
        }
      end
    end
  end
end