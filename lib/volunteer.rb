class Volunteer
  attr_reader :name, :id, :project_id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
    @project_id = attributes[:project_id]
  end

  def save
    result = DB.exec("INSERT INTO volunteer (name, project_id) VALUES ('#{@name}', '#{@project_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end
end
