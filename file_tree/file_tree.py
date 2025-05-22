from textual.app import App
from textual.widgets import Header, Footer, Static
from textual.containers import Container
from tree import get_dirs

print(get_dirs)
class HelloTextual(App):
          
     def compose(self):
         dirs_data = get_dirs()
         dirs = dirs_data['dirs']
         current_dir  = dirs_data['current_dir']
         def static_dirs():
             for dir in dirs:
                 yield Static(dir)
         yield Header()
    
         yield Container(
    	     Static(f"{current_dir}/"),
             *[Static(d) for d in dirs],
             id="main"
         )
         yield Footer()

if __name__ == "__main__":
    HelloTextual().run()
