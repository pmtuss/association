class Admin::UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @users = User.search(params[:name]).order(sort_column + " " + sort_direction)
  end

  private
    def user_params
      params.permit(:name)
    end

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end