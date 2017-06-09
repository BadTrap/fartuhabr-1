class Admin::AdminController < ApplicationController
before_action :authenticate_user!
before_action :check_admin

protected
def check_admin
  redirect_to root_path, alert: "У Вас нема прав для доступа до даної сторінки сайту" unless current_user.admin?
end
end
