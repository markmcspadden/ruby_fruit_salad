class ExercisesController < ApplicationController

  def show
    id = params[:id]

    # When the default route
    id = 1 if !params[:id]

    @exercise = Exercise.find(id)
  end

  def eval
    @exercise = Exercise.find(params[:id])

    args = Exercise.args_conversion(params[:args], @exercise[:id])

    result = @exercise[:collection].send(@exercise[:method], args)

    render :json => result.to_json
  end

end