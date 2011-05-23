class Rule

# Rule is a singleton class that will choose a rule and apply it when requested,
# or test a user's entry to make sure it conforms.

# Define rules here
# Convention of the arrays are:
# 1) Symbol of the attribute being tested
# 2) The value for which we are testing
# 3) An array containing the parameters of the condition being met
# 4) An array containing the parameters of a condition not being met

@@rules = { 1 => [:figure,"lozenge",[nil,"blue",nil],["AGENT_SIZE",nil,nil]],
            2 => [:color,"yellow",["big",nil,nil],["small",nil,nil]],
            3 => [:color,"yellow",[nil,nil,"circle"],[nil,nil,"lozenge"]],
            4 => [:color,"blue",[nil,nil,"circle"],[nil,nil,"lozenge"]],
            5 => [:color,"blue",["big",nil,nil],[nil,nil,nil]],
            6 => [:color,"blue",["big",nil,nil],[nil,nil,"circle"]],
            7 => [:figure,"circle",[nil,"blue",nil],[nil,"yellow",nil]],
            8 => [:figure,"circle",["small",nil,nil],["big",nil,nil]]
           }


def initialize
  pick_rule
end

def pick_rule
  @chosen_rule =  rand(@@rules.size) + 1
end

# Accessor method for the chosen_rule instance variable
def chosen_rule
  @chosen_rule
end

# This method is called to check the user's input against the rules
def user_smart?(agent,useragent)
 attribute,condition,if_true,if_false = *@@rules[@chosen_rule]
 # Update the potential tokens (such as AGENT_SIZE) with the actual values of the beforeagent object 
 modified_true  = get_modified_array(agent,if_true)
 modified_false = get_modified_array(agent,if_false)
 
 if agent.agent[attribute].to_s == condition 
   then array_to_check = modified_true 
   else array_to_check = modified_false end
 
 returnval = true
 # If any part of this check fails, the user is wrong
 arraypointer = 0
 array_to_check.each do |arrayval|
   if !arrayval.nil? then
     case arraypointer
      when 0
       returnval = useragent.agent[:size].to_s == arrayval
      when 1
       returnval = useragent.agent[:color].to_s == arrayval
      when 2
       returnval = useragent.agent[:figure].to_s == arrayval
     end
   end
   arraypointer = arraypointer + 1
 end
 returnval
end

# This method is called when the computer is picking the first three items.
def computerpick(beforeagent)
 attribute,condition,if_true,if_false = *@@rules[@chosen_rule]

 # Update the tokens (such as AGENT_SIZE) with the actual values of the beforeagent object 
 modified_true  = get_modified_array(beforeagent,if_true)
 modified_false = get_modified_array(beforeagent,if_false)

 returnagent = beforeagent  # to ensure that we do not pick the same item, 
                            # we will keep picking until we have something else
 while (returnagent.to_s == beforeagent.to_s) do
  if beforeagent.agent[attribute].to_s == condition
   then returnagent = Agent.new(*modified_true)
   else returnagent = Agent.new(*modified_false) end
  end
returnagent
end

# Modifies the tokens in the rules to make a working copy
def get_modified_array(beforeagent,array_to_modify)
 modified = []
 array_to_modify.each do |i| 
 if !i.nil? then 
    new_string = i.gsub("AGENT_SIZE",beforeagent.agent[:size].to_s)
    new_string.gsub!("AGENT_FIGURE",beforeagent.agent[:figure].to_s)
    new_string.gsub!("AGENT_COLOR",beforeagent.agent[:color].to_s)
    modified.push(new_string)
    else modified.push(nil) end end
 modified
end

end

