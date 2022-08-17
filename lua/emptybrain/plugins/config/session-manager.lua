local status_ok, session_manager = pcall(require, "session_manager")
if not status_ok then
	return
end

session_manager.setup({
    autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
	autosave_last_session = true,
	autosave_only_in_session = false,
})

