require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/calendar'
require 'sinatra/flash'

class CalendarApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  register Sinatra::Flash

  get '/' do
    c = Calendar.new
    @days = c.get_days(DateTime.now.year, DateTime.now.month)
    @month = DateTime.now.month
    @year = DateTime.now.year
    @next_month = @month.to_i+1
    @next_year = @year.to_i+1
    session[:year] = @year
    erb :index
  end

  post '/post-month' do
    c = Calendar.new
    @next_month = 1
    @days = c.get_days(params[:year_input].to_i, params[:month_input].to_i)
    session[:month] = params[:month_input]
    session[:year] = params[:year_input]
    @month = session[:month]
    @year = session[:year]
    erb :index
  end

  post '/next-month' do
    c = Calendar.new
    @next_month = 1
    @month = params[:month].to_i+1
    @next_year = params[:next_year].to_i
    @year = session[:year]
    if @month.to_i <= 12
      @next_year = session[:year]
    else
      @next_month = 1
      @month = 1
    end
    if @month.to_i < 12
      @next_month = @month.to_i+1
    else
      @next_month = 1
    end

    if params[:next_month].to_i == 1
      session[:year] = @year.to_i+1
      @year = session[:year]
    else
      @year = @year
    end
    @days = c.get_days(@year.to_i, @month.to_i)
    erb :index
  end

  run! if app_file == $0
end