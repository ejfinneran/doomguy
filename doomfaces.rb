require 'sinatra/base'

class Doomfaces < Sinatra::Base

  set :root, File.dirname(__FILE__)

  def file_for_value(value, options = {})
    damage = [100, value].min
    damage = 100 - damage if options[:inverse]
    id = [4, damage/20].min
    "face#{id}.gif"
  end

  set :public_folder, 'images'

  get "/" do
    erb :index
  end

  get "/application.js" do
    coffee :application
  end

  get "/styles.css" do
    send_file "views/styles.css"
  end

  get %r{/damage/(\d+).gif} do
    redirect to(file_for_value(params[:captures].first.to_i))
  end

  get %r{/inverse/(\d+).gif} do
    redirect to(file_for_value(params[:captures].first.to_i, inverse: true))
  end

end
