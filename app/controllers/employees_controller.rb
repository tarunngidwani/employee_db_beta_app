class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show]

  def index
    @employees = Employee.all
  end

  def show; end

  def new; end

  def edit; end

  def create; end

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
