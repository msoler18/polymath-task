class ApplicationController < ActionController::Base

  include Pagy::Backend

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end

end
