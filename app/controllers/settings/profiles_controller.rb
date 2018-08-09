module Settings
  class ProfilesController < ApplicationController
    before_action :load_resource

    def edit
    end

    def update
      if @profile.update(profile_params)
        flash[:notice] = "successfully updated profile"
        redirect_to edit_settings_profile_path
      else
        render :edit
      end
    end

    private

    def profile_params
      params.require(:profile).permit(:full_name,
                                      :bio,
                                      :avatar,
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

    def load_resource
      @profile = current_user.profile
    end
  end
end
