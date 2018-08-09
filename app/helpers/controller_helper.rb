module ControllerHelper
  def only_new_params(parameters, model)
    parameters.each do |k, v|
      if v == model[k]
        parameters.delete(k)
      end
    end
  end
end