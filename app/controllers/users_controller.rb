class UsersController < ApplicationController


  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)
    @products=Product.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url,
                                  notice: "User #{@user.name} was successfully created." }
        format.json { render action: 'show',
                             status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(params[:user])
        format.html { redirect_to users_url,
                                  notice: "User #{@user.name} was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors,
                             status: :unprocessable_entity }
      end
    end
  end
end

# DELETE /users/1
# DELETE /users/1.json