def humanized_time_ago(time_ago_in_minutes)
  if time_ago_in_minutes >= 60
    "#{time_ago_in_minutes / 60} hours ago"
  else
    "#{time_ago_in_minutes} minutes ago"
  end
end

get '/' do
  finstagram_post_shark = {
    username: "sharky_j",
    avatar_url: "http://naserca.com/images/sharky_j.jpg",
    photo_url: "http://naserca.com/images/shark.jpg",
    humanized_time_ago: humanized_time_ago(15),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "sharky_j",
      text: "Out for the long weekend... too embarrassed to show y'all the beach bod!"
    }]
  }

  finstagram_post_whale = {
    username: "kirk_whalum",
    avatar_url: "http://naserca.com/images/kirk_whalum.jpg",
    photo_url: "http://naserca.com/images/whale.jpg",
    humanized_time_ago: humanized_time_ago(65),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "kirk_whalum",
      text: "#weekendvibes"
    }]
  }

  finstagram_post_marlin = {
    username: "marlin_peppa",
    avatar_url: "http://naserca.com/images/marlin_peppa.jpg",
    photo_url: "http://naserca.com/images/marlin.jpg",
    humanized_time_ago: humanized_time_ago(190),
    like_count: 0,
    comment_count: 1,
    comments: [{
      username: "marlin_peppa",
      text: "lunchtime! ;)"
    }]
  }
   @finstagram_posts = [finstagram_post_shark, finstagram_post_whale, finstagram_post_marlin]
   erb (:index)
end

get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end

get '/signup' do     
  @user = User.new   
  erb(:signup)       
end

post '/signup' do
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  if @user.save
    "User #{username} saved!"
  else
    erb(:signup)
  end
end

get '/finstagram_posts/new' do
    erb(:"finstagram_posts/new")
end
 
post'/finstagram_posts' do
    params.to_s
end