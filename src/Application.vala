/***********************************************************************************************************************
 * Application.vala
 * 
 * Copyright 2012 Axel FILMORE <axel.filmore@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License Version 2.
 * http://www.gnu.org/licenses/gpl-2.0.txt
 * 
 * 
 * 
 * Purpose: The Main Application Class and program's entry point.
 * 
 * 
 * 
 **********************************************************************************************************************/
namespace Template {

    Application     global_app;
    bool            global_debug_mode;
    
    public const OptionEntry[] opt_entries = {
        
        {"debug",   'd',    0,  OptionArg.NONE, ref global_debug_mode,  N_("Run In Debug Mode"), null},
        {null}
    };

    public class Application : GLib.Application {
        
        bool _debug_mode = false;
        
        public Application (bool debug = false) {
            
            Object (application_id:"org.noname.gtktemplate", flags:(ApplicationFlags.HANDLES_COMMAND_LINE));
            
            _debug_mode = debug;
        }
        
        public void new_window () {
            
            Template.Window window = new Template.Window ();
            window.create ("", _debug_mode);
        }
        
        private void _on_startup () {
            
            stdout.printf ("on_startup\n");
        }
        
        private int _on_command_line (ApplicationCommandLine command_line) {
            
            bool primary_instance = !command_line.get_is_remote ();
            
            if (primary_instance) {
                print ("Primary Instance Command Line !!!\n");
            } else {
                print ("Remote Command Line !!!\n");
            }
            
            string[] args = command_line.get_arguments ();

            //this.activate ();

            if (primary_instance) {

                this.hold ();
            }
            return 0;
        }
        
        private void _on_activated () {

            stdout.printf ("on_activated\n");
        }
        
        
        /*******************************************************************************************
         * Application's entry point.
         *
         * 
         * 
         ******************************************************************************************/
        private static int main (string[] args) {
            
            try {
                Gtk.init_with_args (ref args, "", opt_entries, VConfig.GETTEXT_PACKAGE);
            } catch {
            }
            
            global_app = new Application (true);
            
            global_app.activate.connect (global_app._on_activated);
            global_app.startup.connect (global_app._on_startup);
            global_app.command_line.connect (global_app._on_command_line);
            
            try {
                global_app.register (null);
            } catch (Error e) {
                print ("Application Error: %s\n", e.message);
                return -1;
            }
            
            if (!global_app.get_is_remote ()) {
                
                global_app.new_window ();

            } else {
            }
            
            return global_app.run (args);
        }
    }
}


