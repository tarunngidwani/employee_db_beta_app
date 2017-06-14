class EmployeesController < ApplicationController
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
end
