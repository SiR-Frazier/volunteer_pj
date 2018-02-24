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

post('/project') do
  erb(:success)
end

get('/project') do
  erb(:projects)
end

patch("/project/:id") do
  title = params.fetch("title")
  @project = Project.find(params.fetch("id").to_i)
  @project.update({:name => name})
  @projects = Project.all()
  erb(:success)
end

delete("/project/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:projects)
end
