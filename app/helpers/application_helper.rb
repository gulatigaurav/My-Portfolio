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

def nav_items
 [
   {
     url: root_path,
     title: 'Home'
   },
   {
     url: about_path,
     title: 'About me'
   },
   {
     url: contact_path,
     title: 'Contact'
   },
   {
     url: blogs_path,
     title: 'Blogs'
   },
   {
     url: portfolios_path,
     title: 'Portfolio'
   }

 ]
end





  def nav_helper style, tag_type
   nav_links = ''

   nav_items.each do |item|
    nav_links << "<#{tag_type}>    <a href='#{item[:url]}' class='#{style} #{active? item[:url]}'> #{item[:title]} </a>   </#{tag_type}>
"
   end

# nav_links = <<NAV
# <#{tag_type}>    <a href="#{root_path}" class="#{style} #{active? root_path}">Home</a>   </#{tag_type}>
# <#{tag_type}>    <a href="#{about_path}" class="#{style} #{active? about_path}" >About me</a>   </#{tag_type}>
# <#{tag_type}>    <a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a>   </#{tag_type}>
# <#{tag_type}>    <a href="#{blogs_path}" class="#{style} #{active? blogs_path}">Blogs</a>   </#{tag_type}>
# <#{tag_type}>    <a href="#{portfolios_path}"class="#{style}">Portfolio</a>   </#{tag_type}>
#
# NAV
 nav_links.html_safe
  end

def active? path
 "active" if current_page? path
end

end
