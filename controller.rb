require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/house')
require_relative('./models/student')


get "/" do
  @students = Student.all()
  erb(:home)
end


get "/student" do
  @students = Student.all()
  erb(:index)
end

get "/student/new" do
  @house = House.all()
  erb(:new)
end

get "/student/:id" do
   @student = Student.find(params[:id])
   @student.save()
  erb(:show)
end

post "/student" do
   @student = Student.new(params)
   @student.save()
  redirect "/student"
end
