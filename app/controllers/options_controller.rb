class OptionsController < ApplicationController
  def index
    options = Option.by_option_type(params[:type])

    render json: { options: options }
  end
end
