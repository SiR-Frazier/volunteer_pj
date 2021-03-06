class Project
  attr_reader(:title, :id)

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def self.all
    projects = []
    returned_projects = DB.exec("SELECT * FROM project;")
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i()
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO project (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
    # binding.pry
  end

  def ==(another_project)
    self.title().==(another_project.title()).& self.id().==(another_project.id())
  end

  def self.find(id)
    found_project = nil
    Project.all().each() do |project|
      if project.id().==(id)
        found_project = project
      end
    end
    found_project
  end

  def volunteers
    volunteersList = []
    volunteers = DB.exec("SELECT * FROM volunteer WHERE project_id = #{self.id()};")
    volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id")
      id = volunteer.fetch("id").to_i
      volunteersList.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteersList
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    @id = self.id()
    DB.exec("UPDATE project SET title = '#{@title}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM project WHERE id = #{self.id()};")
  end
end
