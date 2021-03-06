class My::UsersController < My::ApplicationController
  def edit
    authorize current_user

    if signed_in_as_master?
      edit_master
    else
      edit_user
    end
  end

  def update
    authorize current_user

    if signed_in_as_master?
      update_master
    else
      update_user
    end
  end

  private

    def edit_master
      run User::Operation::Update::Master::Present

      render 'edit_master'
    end

    def update_master
      run User::Operation::Update::Master, user_params do |result|
        return redirect_to edit_my_user_path, notice: 'Профиль отредактирован'
      end

      render 'edit_master'
    end

    def edit_user
      run User::Operation::Update::User::Present

      render 'edit_user'
    end

    def update_user
      run User::Operation::Update::User, user_params do |result|
        return redirect_to edit_my_user_path, notice: 'Профиль отредактирован'
      end

      render 'edit_user'
    end

    def user_params
      params.require(:user).permit!
    end
end
