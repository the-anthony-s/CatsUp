class UsersController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :set_user, only: %i[show update destroy]

  def index
    # display selected users or return all
    ids = user_params[:ids] ? user_params[:ids].split(',').map(&:to_i) : nil
    @user = ids ? User.where(id: ids).index_by(&:id).slice(*ids).values : User.all

    json_response(@user)
  end

  def new; end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def show
    json_response(@user)
  end

  def edit; end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  # Allow only trusted parameters
  # :ids -> to get an array of records
  def user_params
    params.permit(:ids, :name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
