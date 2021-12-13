class TodosController < ApplicationController
  def index
    todos = Todo.all
    serialized_object = TodoSerializer.render_as_json(todos, root: :todos)
    render_200 message: 'Get todos', data: serialized_object
  end

  def create
    todo = Todo.new(todo_params)
    todo.save!
  rescue StandardError
    render_400 message: 'Failed create todo'
  else
    serialized_object = TodoSerializer.render_as_json(todo, root: :todo)
    render_201 message: 'Create todo', data: serialized_object
  end

  def update
    todo = Todo.find(params[:id])
    todo.update!(todo_params)
  rescue StandardError
    render_400 message: 'Failed update todo'
  else
    serialized_object = TodoSerializer.render_as_json(todo, root: :todo)
    render_200 message: 'Update todo', data: serialized_object
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy!
  rescue StandardError
    render_400 message: 'Failed destroy todo'
  else
    serialized_object = TodoSerializer.render_as_json(todo, root: :todo)
    render_200 message: 'Destroy todo', data: serialized_object
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body, :status)
  end

  # 200 Success
  def render_200(message: '', data: {})
    resp_body = {
      status: 200,
      message: message,
      data: data
    }
    render status: :ok, json: resp_body
  end

  # 201 Created
  def render_201(message: '', data: {})
    resp_body = {
      status: 201,
      message: message,
      data: data
    }
    render status: :ok, json: resp_body
  end

  # 400 Bad Request
  def render_400(message: '', data: {})
    resp_body = {
      status: 400,
      message: message,
      data: data
    }
    render status: :ok, json: resp_body
  end
end
