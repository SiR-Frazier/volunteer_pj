require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require("./lib/volunteer")
require("pg")

  # DB = PG.connect({:dbname => "volunteer_tracker"}) switch to v_t before submitting
  DB = PG.connect({:dbname => "volunteer_tracker_test"})

get('/') do
  erb(:home)
end

get('/project/new') do
  erb(:project_form)
end

post('/project/new') do
  title = params.fetch("title")
  project = Project.new({:title => title, :id => nil})
  project.save()
  erb(:success)
end

get('/projects') do
  @projects = Project.all()
  erb(:projects)
end

get('/project/:id/edit') do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

get('/project/:id') do
  @project = Project.find(params.fetch("id").to_i())
  @volunteer = Volunteer.all()
  erb(:project)
end

patch("/project/:id") do
  title = params.fetch("title")
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:title => title})
  @projects = Project.all()
  erb(:success)
end

delete("/project/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:projects)
end

post('/project/:id') do
  @project = Project.find(params.fetch("id").to_i())
  name = params.fetch("name")
  project_id = params.fetch("id")
  volunteer_new = Volunteer.new({:name => name, :project_id => project_id, :id => nil})
  volunteer_new.save()
  @volunteers = Volunteer.all()
  # title = params.fetch("title") Project.find(params.fetch("id").to_i())
  # volunteer = Volunteer.new({name: => name, :id => nil, :project_id => project_id})
  # volunteer.save()
  # @volunteers.all
  erb(:success)
end
