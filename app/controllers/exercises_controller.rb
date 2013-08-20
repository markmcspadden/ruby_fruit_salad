class ExercisesController < ApplicationController

  EXERCISES = {"1" =>
                    {collection:["1f34e","1f34a","1f34b"], 
                      method:"[]".to_sym,
                      args_conversion:"to_i",
                      default:"0"
                    }
              }

  def show
    id = params[:id]

    # When the default route
    id = 1 if !params[:id]

    @exercise = EXERCISES[id.to_s]
  end

  def eval
    @exercise = EXERCISES[params[:id].to_s]

    result = @exercise[:collection].send(@exercise[:method], params[:args].send(@exercise[:args_conversion]))

    render :json => result.to_json
  end

end