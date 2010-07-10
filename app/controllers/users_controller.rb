class UsersController < InheritedResources::Base
  actions :new, :create, :edit, :update
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  create! do |success, failure|
    success.html { redirect_to root_url }
    failure.html { render :action => :new }
  end
  
  update! do |success, failure|
    success.html { redirect_to root_url }
    failure.html { render :action => :edit }
  end

private
  def resource
    @user = @current_user
  end
end
