module WikisHelper
  def is_collaborator?(wiki)
    wiki.collaborators.where(user_id: current_user)
  end
end
