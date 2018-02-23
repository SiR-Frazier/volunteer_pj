class Project
  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def self.all
    projects = []
    returned_projects = DB.exec("SELECT * FROM project;")
    returned_projects.each() do |list|
      title = title.fetch(:title)
      id = id.fetch(:id)
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO project (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_project)
    self.title().==(another_project.title()).& self.id().==(another_project.id())
  end
end
