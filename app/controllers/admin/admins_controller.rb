class Admin::AdminsController < ApplicationController
  before_action :logged_in_user, :is_admin?
  layout "layouts/admin/application"

  def index
    @receipts = Receipt.status_priority.latest
                       .page(params[:page]).per(Settings.per_page_18)
  end
end
