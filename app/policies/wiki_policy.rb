class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

 def initialize(user, wiki)
   @user = user
   @wiki = wiki
 end

 def update?
   user.admin? or user.premium? or is_collaborator?(wiki) or wiki.user == user
 end

 def destroy?
   user.admin? or wiki.user == user
 end

 def is_collaborator?(wiki)
   wiki.collaborators.where(user_id: user)
 end

end
