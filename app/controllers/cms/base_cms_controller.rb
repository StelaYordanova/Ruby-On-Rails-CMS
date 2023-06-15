class Cms::BaseCmsController < ApplicationController

  before_action :authenticate_user!
  before_action :check_admin_role

  def check_admin_role
    redirect_to root_path, alert: 'Access denied' unless current_user.admin?
  end
end