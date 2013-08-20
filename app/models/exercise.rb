class Exercise

  EXERCISES = { "1" =>
                    {collection:["1f34e","1f34a","1f34b","1f352"], 
                      method:"[]".to_sym,
                      args_conversion:"to_i",
                      default:"0",
                      id:"1",
                      partial:"one",
                      name: "Array#[]"
                    },
                "2" =>
                    {collection:["1f34e","1f34a","1f34b","1f352"], 
                      method:"+".to_sym,
                      args_conversion:"split",
                      default:["1f347","1f353"],
                      id:"2",
                      partial:"two",
                      name: "Array#+"
                    }
              }

  def self.find(id)
    EXERCISES[id.to_s]
  end

  def self.args_conversion(args, id)
    case id
      when "2"
        coder = HTMLEntities.new
        
        args.split(",").compact.collect{ |a| coder.encode(a, :hexadecimal).gsub("&#x","").gsub(";","") }
      else
        args.send(Exercise.find(id)[:args_conversion])
    end
  end

end