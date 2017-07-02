module Sessions
  extend ActiveSupport::Concern

  private

  def current_user
    session['current_user']
  end
end
