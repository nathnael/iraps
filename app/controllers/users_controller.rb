class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :roles, :updateRoles, :user_profile, :updateDepartments, :updatePermissions,:updateUserPreference]
  include Administrated 

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    authorize User
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @all_permissions = Permission.all
    @unique_permissions = Permission.pluck(:name).uniq!
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    
  end

  def profile
    @user = User.find(params[:user_id])
  end

  def user_preference
     
    @user = User.find(params[:id])

  end
  
  def updateUserPreference
   
    user = User.find(@user.id)
    user.calendar = params[:calendar]
    user.language = params[:language]
    user.keyboard = params[:keyboard]
    user.default_uom = params[:unit_of_measure]
    if user.save
      flash['success']= "Preference updated successfully"
      redirect_to action: 'user_preference'
    else
      flash['error']= "Preference was not updated"
      redirect_to action: 'user_preference'
    end
  end

  def user_departments
    @user = User.find(params[:user_id])
  end

  def user_permissions
    @user = User.find(params[:user_id])
    @all_permissions = Permission.all
    @unique_permissions = Permission.pluck(:name).uniq!
  end



  def updateDepartments
         redirect_to  @user
    end
  


  def updatePermissions
    puts @user.id

    if(params[:permissions].present?)
      new_permissions = params.require(:permissions)
      UsersPermission.where(user_id: @user.id).destroy_all

      new_permissions.each do |permission|
        _permission = UsersPermission.new ({
                                            permission_id: permission.to_i,
                                            user_id: @user.id
        })
        _permission.modified_by = current_user.id
        _permission.save
      end
    else
      UsersPermission.where(user_id: @user.id).destroy_all
    end

    redirect_to @user, success: 'User profile was successfully updated.'
  end



def updateDepartmentPermission

    redirect_to departments_path, success: 'Department detail was successfully updated.' 
 end


  # GET /users/1/roles
  def roles
    @all_roles = Role.all
  end

  # PUT /users/updateRoles
  def updateRoles

    new_roles = params.require(:roles).permit!.keys.map { |key| key.to_sym}

    @user.roles =[]
    @user.modified_by = current_user.id
    @user.save

    new_roles.each do |role|
      @user.modified_by = current_user.id
      @user.add_role role
    end


    redirect_to @user, success: 'Roles successfully updated.'


  end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.created_by = current_user.id
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, success: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.modified_by = current_user.id
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, success: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :is_active, :hub_id, :location_id, :mobile_no, :user_types, :department_id)
  end
end
