class UsersController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    # display selected users or return all
    ids = user_params[:ids] ? user_params[:ids].split(',').map(&:to_i) : nil
    @user = ids ? User.where(id: ids).index_by(&:id).slice(*ids).values : User.default_order.all

    json_response(@user)
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  def edit; end

  # PATCH/PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  # GET /users/search?name=params[:name]&email=params[:email]
  def search
    name = user_params[:name] ? user_params[:name].downcase : ' '
    email = user_params[:email] ? user_params[:email].downcase : ' '
    @users = User.where('lower(name) LIKE ? OR lower(email) LIKE ?', "%#{name}%", "%#{email}%").map(&:as_json)

    json_response(@users)
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
