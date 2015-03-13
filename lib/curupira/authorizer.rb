module Curupira
  module Authorizer
    extend ActiveSupport::Concern

    def authorize_for_group
      unless has_authorization_for_group?
        deny_access
      end
    end

    def authorize
      unless has_authorization?
        deny_access
      end
    end

    def has_authorization?
      query(params).present?
    end

    def has_authorization_for(params)
      query(params).present?
    end

    private

    def deny_access
      redirect_to "/", notice: "Sem autorização"
    end

    def query(params)
      User.joins(
        role_group_users: { role: { features: [:services, :action_labels] } } 
      )
      .where(
        services: { name: params[:controller] },
        action_labels: { name: params[:action] },
        id: current_user
      )
    end
  end
end