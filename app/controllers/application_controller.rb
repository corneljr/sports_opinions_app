class ApplicationController < ActionController::Base
	before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :null_session

  def current_user_has_voted?(object)
    object.votes.exists?(user_id: current_user.id)
  end

  def vote_average(object)
    sum = 0
    object.votes.each do |vote|
      sum += vote.quality
    end

    if object.votes.count > 0
      @vote_average = sum / object.votes.count 
    else 
      @vote_average = 0
    end
  end

  helper_method :current_user_has_voted

  protected

  def configure_devise_permitted_parameters
    registration_params = [:user_name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end
