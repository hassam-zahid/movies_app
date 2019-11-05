class ApplicationController < ActionController::Base
  before_action :auto_loads

  def auto_loads
    @target_route = "#{params[:action]}_#{params[:controller]}"
    puts "=========#{@target_route}=========="
  end

  def validate_access
    if user_signed_in? && current_user.user_role != 'admin'
      sign_out current_user
    end
  end
end
