# ADD GENRES
[ 'Action',
  'Adventure',
  'Animation',
  'Biography',
  'Comedy',
  'Crime',
  'Documentary Drama',
  'Fantasy',
  'History',
  'Horror',
  'Musical',
  'Mystery',
  'Romance',
  'Sci-Fi',
  'Thriller',
  'War',
  'Western',
].each do |genre|
  Genre.find_or_create_by(name: genre)
end

# Create test users
%w[
   ​diego@scissorboy.com​
   grant@scissorboy.com​
   hssmmlik@gmail.com
].each do |email|
  user = User.new(:email => email, :password => 'XXPS_75D~', :password_confirmation => 'XXPS_75D~', :user_name => email.split('@').first, :user_role => 'admin')
  user.save
end