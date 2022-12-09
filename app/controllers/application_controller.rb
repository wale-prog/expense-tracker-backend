class ApplicationController < ActionController::Base
  # before_filter :session_expiry
  # before_filter :update_activity_time
  skip_before_action :verify_authenticity_token

  # def session_expiry
  #   get_session_time_left
  #   unless @session_time_left > 0
  #     logout
  #   end
  # end

  # def get_session_time_left
  #   expire_time = session[:expires_at] || Time.now
  #   @session_time_left = (expire_time - Time.now).to_i
  # end
  
  # def update_activity_time
  #   session[:expires_at] - 1.minutes.from_now
  # end
end
