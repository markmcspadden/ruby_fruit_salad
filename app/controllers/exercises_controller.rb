class ExercisesController < ApplicationController

  def show
    id = params[:id]

    # When the default route
    id = 1 if !params[:id]

    @exercise = Exercise.find(id)
  end

  def eval
    @exercise = Exercise.find(params[:id])

    args = params[:args]

    # unless @exercise[:args_conversion].blank?
    #   args = args.send(@exercise[:args_conversion])
    # end

    args = Exercise.args_conversion(args, @exercise[:id])

    puts args
    puts args.class

    result = @exercise[:collection].send(@exercise[:method], args)

    render :json => result.to_json
  end

end