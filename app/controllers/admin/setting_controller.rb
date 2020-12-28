module Admin
  class SettingController < BaseController
    def edit
      @setting = Setting.last
    end

    def update
      @setting = Setting.last

      if @setting.update params[:setting]
        redirect_to root_path, notice: "Setting was successfully updated."
      else
        render :edit
      end
    end
  end
end
