class TodosController < ApplicationController

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
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = 'Todo was successfully updated'
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy
      flash[:notice] = 'deleted successfully'
      redirect_to todos_path
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:name, :description)
    end
  
end