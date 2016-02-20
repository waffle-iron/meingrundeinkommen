class Tandem < ActiveRecord::Base

  validate :swopped

  def swopped
    return false if invitee_id && inviter_id && Tandem.where(inviter_id: invitee_id, invitee_id: inviter_id).count > 0
  end

end
