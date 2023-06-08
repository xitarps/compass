class ProfilesController < ApplicationController
  # before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = policy_scope(User)
    @mentors = helpers.match(current_user)
  end

  def show
    @user = User.find(params[:id])
    @match = Match.new
    if current_user.mentor?
      @matched = Match.where(mentor_id: current_user.id, mentee_id: @user.id, matched: true).first
    else
      @matched = Match.where(mentor_id: @user.id, mentee_id: current_user.id, matched: true).first
    end
    authorize @user
  end

  # def edit
  #   authorize @user
  # end

  # def update
  #   authorize @user
  #   @user.update(user_params)
  #   redirect_to user_path(@user)
  # end

  # def new
  #   @user = User.new
  #   authorize @user
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to user_path(@user)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  #   authorize @user
  # end

  # def destroy
  #   authorize @user
  #   @user.destroy
  #   redirect_to root_path, notice: 'Usuário removido com sucesso.', status: :see_other
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :country, :state, :city, :professional_field, :academic_degree, :programming_language, :mentor_current_employer, :mentor_transition_date, :github, :linkedin, :personal_site, :other_info)
  # end

  # def set_user
  #   User.find(params[:id])
  # end
end
