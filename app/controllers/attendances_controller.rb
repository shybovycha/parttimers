class AttendancesController < InheritedResources::Base
    before_filter :set_user, :only => [ :index ]

    protected

    def set_user
        if params[:user].present?
            @user = AdminUser.find_by_email(params[:user])
        end

        @user ||= current_admin_user
        @user ||= AdminUser.first

        if @user.blank?
            redirect_to 'admin/dashboard#index'
        end
    end
end
