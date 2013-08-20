class Exercise

  EXERCISES = {"1" =>
                    {collection:["1f34e","1f34a","1f34b","1f352"], 
                      method:"[]".to_sym,
                      args_conversion:"to_i",
                      default:"0",
                      id:"1",
                      partial:"one",
                      name: "Array#[]"
                    }
              }

  def self.find(id)
    EXERCISES[id.to_s]
  end

end