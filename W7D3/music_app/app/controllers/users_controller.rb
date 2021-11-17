class UsersController < ApplicationController

    def new
        @user = User.new #this is a dummy obj. review why it's needed.
        render :new #renders form where key-val pairs of attributes can be assigned
    end

    def edit
        @user = User.find(params[:id]) #find user specified by wildcard in url and passed along in request by params
        render :edit #will be same as :new view but with prepopulated data
    end

    def index
        @users = User.all #needs to held in inst var so that it can be passed to :index view
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show #QUESTION: why not redirect_to user_url(@user)? ==> this results in infinite loop
    end

    def create
        @user = User.new(new_user_params)
        if @user.save!
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:messages] = @user.errors.full_messages #QUESTION: why not --> flash.now[:messages] = "Sorry! invalid credentials"
            render :new
        end
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(new_user_params)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url #we redirect to users index to show that destroyed user is no longer there
    end
    
    def new_user_params
        params.require(:user).permit(:email, :password)
    end
end
