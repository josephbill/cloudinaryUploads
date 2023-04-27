# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

3.1.2

* System dependencies

Check gemfile

* Configuration

check gemfile 
bundle install

* Database creation

sqlite3 in use 

* Database initialization
check database.yml

* steps 

1. add carrierwave gem and cloudinary gem in your gemfile

gem ‘carrierwave’
gem ‘cloudinary’

2. then run bundle install
3. create cloudinary.yml on your ‘config’ folder, and put the security setting there.

### config/cloudinary.yml
development:
  cloud_name: "sample"
  api_key: "98785549878945"
  api_secret: "3s258d44f1s2a22g22d23a3s3d22a3d2"

production:
  cloud_name: "sample"
  api_key: "98785549878945"
  api_secret: "3s258d44f1s2a22g22d23a3s3d22a3d2"

4. The next thing todo is generate carrierwave uploader.
rails g uploader avatar
where avatar is a reference to the file u need to upload. 

class AvatarUploader < CarrierWave::Uploader::Base
 ### Include RMagick or MiniMagick support:
 ### include CarrierWave::RMagick
 ### include CarrierWave::MiniMagick
 include Cloudinary::CarrierWave
 ### Choose what kind of storage to use for this uploader:
 #storage :file
 ### storage :fog# Override the directory where uploaded files will be stored.
 ### This is a sensible default for uploaders that are meant to be mounted:
 ### def store_dir
 ### “uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}”
 ### end
 end 

5. Add the avatar to existing migrations for the table that saves this data. 

rails g migration AddAvatarToUser avatar:string

then perform a rails db:migrate. 

6. Now add this to the model so that rails recognize the uploader
e.g.
### app/models/user.rb
mount_uploader :avatar, AvatarUploader

7. Finally a sample controller create file method will look like this : 

#apps/controller/users_controller.rb
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


8. In a postman test use this params e.g name and avatar for the model fields 
9. Cloudinary base url will be : 
https://res.cloudinary.com/dqlqmfjkt/ : where dqlqmfjkt represents your cloud name 
the image path will be saved in the model table under the avatar field as per this example : check for name on your end : 
You can then concatenate the base url on cloudinary to the value that the avatar field will have e.g 
https://res.cloudinary.com/dqlqmfjkt/image/upload/v1682588307/hiiepkdtqkurwj34sso6.png  where image/upload/v1682588307/hiiepkdtqkurwj34sso6.png is the value saved in the database. 

