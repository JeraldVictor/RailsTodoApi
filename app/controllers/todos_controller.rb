class TodosController < ApplicationController
  def  index
    @todo = Todo.all()
    render json: { error: false, todo: @todo }
  end

  def show
    @todo = Todo.find(params[:id])
    render json: { error: false, todo: @todo }
  end

  def create
    # print(params)
    # print("\nTitle " + params[:title]+ "\n")
    # print("Des "+ params[:description] +"\n")
    #
    @todo = Todo.new(todo_params)
    if @todo.save() then
      render json: { error: false ,message: "Todo Created" , todo: @todo }
    else
      render json: { error: true , message: @todo.errors.as_json }
    end
  end

  def edit
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params) then
      render json: { error: false ,message: "Todo Updated" , todo: @todo }
    else
      render json: { error: true , message: @todo.errors.as_json }
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.destroy then
      render json: { error: false ,message: "Todo Deleted" }
    else
      render json: { error: true , message: @todo.errors.as_json }
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :description)
  end
end
