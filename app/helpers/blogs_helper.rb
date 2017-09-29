module BlogsHelper
     def news_parser news_item
       tweet ||= "https://newsapi.org/"

       regex = %r{
             \b
             (
               (?: [a-z][\w-]+:
                (?: /{1,3} | [a-z0-9%] ) |
                 www\d{0,3}[.] |
                 [a-z0-9.\-]+[.][a-z]{2,4}/
               )
               (?:
                [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
               )+
               (?:
                 \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
                 [^\s`!()\[\]{};:'".,<>?«»“”‘’]
               )
             )
           }ix

               news_item.gsub(regex) do |url|
        "<a href= #{url} target='_blank'>#{url}</a>"
      end.html_safe
     end



end
