require 'yaml/store'

class TaskManager
  def self.create(task)
    table.insert(:title => task[:title], :description => task[:description])
  end

  def self.all
    table.map { |row| Task.new(row) }
  end

  def self.table
    database.from(:tasks).order(:id)
  end

  def self.find(id)
    raw_task(id).map { |data| Task.new(data) }.first
  end

  def self.update(id, task)
    raw_task(id).update(:title => task[:title], :description => task[:description])
  end

  def self.delete(id)
    raw_task(id).delete
  end

  def self.raw_task(id)
    table.where(:id => id)
  end

  def self.database
    if ENV["TRAFFIC_SPY_ENV"] == "test"
      @database = Sequel.postgres('task-manager-test')
      # @db ||= YAML::Store.new("db/task_manager_test")
    else
      @database = Sequel.postgres('task-manager')
      # @db ||= YAML::Store.new("db/task_manager_dev")
    end
    # @database ||= YAML::Store.new("db/task_manager")
  end
end
