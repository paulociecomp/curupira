class Curupira::AuthorizedController < ApplicationController
  before_filter :require_login

  private

  def not_authenticated
    redirect_to new_session_path, alert: "Por favor, se autentique primeiro"
  end
end
