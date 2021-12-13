class TodoSerializer < ApplicationSerializer
  identifier :id
  fields :title, :body, :status
end
