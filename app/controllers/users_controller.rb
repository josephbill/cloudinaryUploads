class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
          if @user.save
             render json: { result: true, msg: ' The image is sucessfully uploaded!!'}, status: :created
          else
             render json: {result: false, user: @user.errors }, status: :unprocessable_entity
          end
        end

        private

        def user_params
             params.permit(:name, :avatar)
        end

end

