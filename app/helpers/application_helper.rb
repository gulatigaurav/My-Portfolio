module ApplicationHelper
   def login_helper
    #  " <p> My Helper </p>".html_safe
    if current_user.is_a?(User)
     link_to 'Log out', destroy_user_session_path,
                                                 method: :delete
    else
      (link_to 'Register', new_user_registration_path) + " ".html_safe +
      (link_to 'Signin',new_user_session_path)
  end
 end
end
