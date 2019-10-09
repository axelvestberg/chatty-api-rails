class Api::V1::ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :destroy]

  def index
    @programs = Program.all
    render json: @programs
  end

  def create
    @program = Program.new(program_params)
  end

  def destroy
    @program.destroy
  end

  def show
    render json: @programs
  end

  private
    def program_params
      params.require(:program).permit(:title, :start, :stop, :live, :channel_id)
    end

    def set_program
      @program = Program.find(params[:id])
    end
end