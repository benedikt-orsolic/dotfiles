-- Set up by guid from https://github.com/Nawy/nvim-config-examples/blob/main/lsp-java/ftplugin/java.lua

local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
	vim.notiy("JDTLS not found, install with `:LspInstall`")
	return
end

-- See`:help vim.lsp.start_client` for supported config optins
local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local config_dir = jdtls_dir .. "/config_linux"
local plugins_dir = jdtls_dir .. "/plugins/"
local path_to_jar = plugins_dir .. "org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar"
local path_to_lombok = jdtls_dir .. "/lombok.jar"

local root_markers = {
	".git",
	"mvnw",
	"gradlew",
	"pom.xml",
	"build.gradle",
}

local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
os.execute("mkdir " .. workspace_dir)

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. path_to_lombok,
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		path_to_jar,
		"-configuration",
		config_dir,
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	settings = {
		java = {
			configuration = {
				runtimes = {
					{ name = "JavaSE-17", path = "/usr/lib/jvm/java-17-openjdk/" },
					{ name = "JavaSE-21", path = "/usr/lib/jvm/java-21-openjdk/" },
				},
			},
		},
	},
}

jdtls.start_or_attach(config)
