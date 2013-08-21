require 'sinatra/base'

class Doomfaces < Sinatra::Base

  set :root, File.dirname(__FILE__)

  def file_for_value(value, options = {})
    damage = [100, value].min
    damage = 100 - damage if options[:inverse]
    id = [4, damage/20].min
    "images/face#{id}.gif"
  end

  get "/" do
    erb :index
  end

  get "/application.js" do
    coffee :application
  end

  get %r{/damage/(\d+).gif} do
    send_file file_for_value(params[:captures].first.to_i)
  end

  get %r{/inverse/(\d+).gif} do
    send_file file_for_value(params[:captures].first.to_i, inverse: true)
  end

end
