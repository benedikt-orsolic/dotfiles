local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end


telescope.setup {
	pickers = {
		find_files = {
			find_command = { "fd", "-t=f", "-a" },
			path_display = { "absolute" },
			wrap_results = true,
		}
	}
}
