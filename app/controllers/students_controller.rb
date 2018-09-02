class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
    render :index
  end

  def show
    @student = set_student
    if @student.active
      @active = "active"
    else
      @active = "inactive"
    end
    render :show
  end

  def activate
    @student = set_student
    @student.active = !@student.active
    @student.save
    redirect_to student_path(@student)
  end

  # def update
  #   @student = set_student
  #   @student.update(active: params[:student][:active])
  #   redirect_to student_path(@student)
  # end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
