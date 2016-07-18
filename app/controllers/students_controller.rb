class StudentsController < ApplicationController

  def index
    @students = Student.all
    render json: @students
  end

  def show
    set_student
    render json: @student
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end

  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    puts "2 try: I am here! My student is: #{@student}"
    @student.destroy
    puts "I am not here anymore #{@student}!"
    head :no_content
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email)
  end

end
