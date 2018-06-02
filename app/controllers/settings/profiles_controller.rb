module Settings
  class ProfilesController < ApplicationController
    def edit
      @profile = current_user.profile
    end

    def update
      @profile = current_user.profile

      if @profile.update(only_new_params(profile_params, current_user))
        flash[:notice] = 'successfully updated profile'
        redirect_to edit_settings_profile_path
      else
        render :edit
      end
    end

    private

    def profile_params
      params.require(:profile).permit(:full_name,
                                      :bio,
                                      links: [:homepage,
                                              :github])
    end

    def only_new_params(parameters, model)
      parameters.each do |k, v|
        if v == model[k]
          parameters.delete(k)
        end
      end
    end
  end
end
