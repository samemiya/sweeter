module SweetsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_sweets_path
    elsif action_name == 'edit'
      sweet_path
    end
  end
end
