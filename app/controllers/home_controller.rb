class HomeController < ApplicationController

  def index
  end

  def input
    @response = {}
    @content = params[:content]
    @ex = params[:extension]
    @name = SecureRandom.hex(2)
    @input = InputFile.new(@name,@content,@ex)
    @input.createFile
    @input.execute
    @response["response"] = @input.respond
    respond_to do |format|
      format.json { render json: @response}
    end
    FileDeleteJob.perform_later @name
  end

  def test
  end

end
