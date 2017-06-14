class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show]

  def index
    @employees = Employee.all
  end

  def show; end

  def new
    @employee = Employee.new
  end

  def edit; end

  def create
    @employee = Employee.new employee_params

    respond_to do |format|
      if @employee.save
        message = 'Employee record was successfully created.'
        format.html { redirect_to @employee, notice: message }
      else
        format.html { render :new }
      end
    end
  end

  def update; end

  def destroy; end

  private

  def set_employee
    @employee = Employee.find params[:id]
  end

  # White list parameters to retain and
  # pass along to appropriate controller actions
  def employee_params
    params.require(:employee).permit(:name, :house_num, :street_name,
                                     :city, :state_id,  :zip_code)
  end
end
