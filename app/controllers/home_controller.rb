class HomeController < ApplicationController
skip_before_action :authenticate_user!
# home画面(login前)
  def new

  end

# about画面
  def about
  end

end
