# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "$HOME/SnC/web/"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "snc_portal"; then
  # Load a defined window layout.
  load_window "snc_portal_server"
  load_window "code_window"
  new_window "playground"
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
