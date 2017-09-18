class PersonsController < ApplicationController
  def profile
    current_user
  end
end
