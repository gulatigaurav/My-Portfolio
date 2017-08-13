module ApplicationHelper
   def login_helper style_class = ''
    #  " <p> My Helper </p>".html_safe
    if current_user.is_a?(GuestUser)
      (link_to 'Register', new_user_registration_path,class: style_class) + " ".html_safe +
      (link_to 'Signin',new_user_session_path,class: style_class)
    else
     link_to 'Log out', destroy_user_session_path,
                                                 method: :delete,class: style_class
                                               end
 end
 def source_helper(layout_name)
   if session[:source]
     content_tag(:p,"Thanks for visiting us from #{session[:source]}",class: "source-greeting")
   end
 end

 def set_copyright
    GauravFooterCreater::Renderer.copyright 'Gaurav Gulati', 'All Rights Reserved'
 end

end
