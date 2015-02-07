require 'bundler'
Bundler.require

database = Sequel.postgres('task-manager')

database.create_table :tasks do
  primary_key :id
  String      :title,  :size => 255
  String      :description, :size => 255
end
