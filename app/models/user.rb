class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def favorite_movies
    Movie.where(id: FavoriteMovie.where(user_id: self.id).pluck(:movie_id)) rescue []
  end

  def self.authenticate_user(user_name)
    return Notification.notify(999, 'user_name is missing') unless user_name.present?

    new_user = false
    user = User.find_by_user_name(user_name)
    unless user
      user = User.new(:email => "#{user_name}@movies.com", :password => 'XXPS_75D~', :password_confirmation => 'XXPS_75D~', :user_name => user_name)
      user.save
      new_user = true
    end
    Notification.notify(
                    200,
                    'success',
                    {new_user: new_user, user_id: user.id, user_name: user.user_name, created_at: user.created_at}
    )
  end
end
