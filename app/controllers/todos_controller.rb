class TodosController < ApplicationController
  # before_action filter
  before_action :find_todo, only: [:destroy, :show, :update, :edit]

  def index
    @todos = Todo.all
  end

  # New submit to create
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = 'Todo has been created'
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  # Edit submit to update
  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = 'Todo was successfully updated'
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    if @todo.destroy
      flash[:notice] = 'deleted successfully'
      redirect_to todos_path
    end
  end

  private
    # uses with before_action
    def find_todo
      @todo = Todo.find(params[:id])
    end
    # strong params(whitelist params)
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
  
end