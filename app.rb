require_relative 'config/environment'

class App < Sinatra::Base
  get "/piglatinize" do
    erb :user_input
  end

  post "/piglatinize" do
    @text = params[:words]

    @analyzed_text = PigLatinizer.new

    erb :user_output
  end
end