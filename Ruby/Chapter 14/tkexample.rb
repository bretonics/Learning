require 'tk'

root = TkRoot.new { title "First Example" }
TkLabel.new(root) do
   text 'A sample GUI using Tk'
   pack { padx 15; pady 15; side 'left' }
end
Tk.mainloop