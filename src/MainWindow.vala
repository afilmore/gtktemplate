/***********************************************************************************************************************
 * MainWindow.vala
 * 
 * Copyright 2012 Axel FILMORE <axel.filmore@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License Version 2.
 * http://www.gnu.org/licenses/gpl-2.0.txt
 * 
 * 
 * Purpose: 
 * 
 * 
 **********************************************************************************************************************/
namespace Template {
    
    public class Window : Gtk.Window {
        
        private bool _debug_mode = false;
        
        public Window () {
            
            this.destroy.connect ( () => {
                //Gtk.main_quit ();
            });
        }
        
        ~Window () {
        }

        
        /*********************************************************************************
         * Widget Creation...
         * 
         * 
         ********************************************************************************/
        public bool create (string config_file, bool debug = false) {
            
            _debug_mode = debug;
            
            this.set_default_size ((screen.get_width() / 4) * 3, (screen.get_height() / 4) * 3);
            this.set_position (Gtk.WindowPosition.CENTER);

            this.show_all ();

            return true;
        }
    }
}



