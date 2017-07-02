class EmployeesController < ApplicationController
  include Sessions
  before_action :check_user_logged_in
  before_action :set_employee, only: %i[show edit update destroy]

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

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        message = 'Employee record was successfully updated.'
        format.html { redirect_to @employee, notice: message }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee.destroy

    respond_to do |format|
      message = 'Employee record was successfully destroyed.'
      format.html { redirect_to employees_url, notice: message }
    end
  end

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
