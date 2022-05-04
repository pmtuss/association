class Admin::UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :check_admin, only: %i[index export_csv]

  def index
    @users = User.search(params[:email]).order("#{sort_column} #{sort_direction}")
  end

  def export_csv
    csv = ExportCsvService.new User.all, User::CSV_ATTRIBUTES
    respond_to do |format|
      format.csv { send_data csv.perform,
        filename: "users.csv" }
    end
    puts I18n.locale
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : 'email'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def check_admin
    if logged_in?
      redirect_to root_url unless current_user.admin
    else
      redirect_to login_url
    end
  end
end
