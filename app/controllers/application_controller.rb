class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
  	render text: "Hello, motherfuckers!"
  end

  def bye
  	render text: "Goodbye."
  end
end
