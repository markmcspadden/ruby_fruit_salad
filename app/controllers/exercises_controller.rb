class ExercisesController < ApplicationController

  def show
    id = params[:id]

    # When the default route
    id = 1 if !params[:id]

    @exercise = Exercise.find(id)
  end

  def eval
    @exercise = Exercise.find(params[:id])

    result = @exercise[:collection].send(@exercise[:method], params[:args].send(@exercise[:args_conversion]))

    render :json => result.to_json
  end

end