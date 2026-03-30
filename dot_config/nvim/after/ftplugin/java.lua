-- All code below is almost completely AI. I do not understand it. For me it works
wk.add({
	{ "<leader>c", group = "Java", buffer = 0 },
	{ "<leader>ct", group = "Test", buffer = 0 },
	{
		"<leader>ctc",
		function()
			require("jdtls").test_class()
		end,
		desc = "Test class",
		buffer = 0,
	},
	{
		"<leader>ctm",
		function()
			require("jdtls").test_nearest_method()
		end,
		desc = "Test nearest method",
		buffer = 0,
	},
})

local jdtls = require("jdtls")

-- 1. Setup paths
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

-- 2. Bundle Configuration (Following the README logic)
-- We use glob with * to account for version numbers in the JAR files
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/"
local bundles = {}

-- 1. Debug Adapter Bundle
local debug_bundle =
	vim.fn.glob(mason_path .. "java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
if debug_bundle ~= "" then
	table.insert(bundles, debug_bundle)
else
	vim.notify("Java Debug Adapter bundle not found!", vim.log.levels.WARN)
end

-- 2. Test Bundles
local test_bundles = vim.split(vim.fn.glob(mason_path .. "java-test/extension/server/*.jar", 1), "\n")
local excluded = {
	"com.microsoft.java.test.runner-jar-with-dependencies.jar",
	"jacocoagent.jar",
}

for _, jar in ipairs(test_bundles) do
	local fname = vim.fn.fnamemodify(jar, ":t")
	if jar ~= "" and not vim.tbl_contains(excluded, fname) then
		table.insert(bundles, jar)
	end
end

-- Add Java Test bundles (Filtering out unwanted runner jars as per README)
local java_test_bundles =
	vim.split(vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-test/extension/server/*.jar", 1), "\n")

local excluded = {
	"com.microsoft.java.test.runner-jar-with-dependencies.jar",
	"jacocoagent.jar",
}

for _, java_test_jar in ipairs(java_test_bundles) do
	local fname = vim.fn.fnamemodify(java_test_jar, ":t")
	if not vim.tbl_contains(excluded, fname) then
		table.insert(bundles, java_test_jar)
	end
end

-- 3. The configuration
local config = {
	cmd = {
		"jdtls",
		"-data",
		workspace_dir,
	},
	root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),

	-- This is correctly passed to the server to load the debug/test extensions
	init_options = {
		bundles = bundles,
	},

	on_attach = function(client, bufnr)
		-- 1. Register the adapter
		require("jdtls").setup_dap({ hotcodereplace = "auto" })

		-- 2. Discover main classes (This populates dap.configurations.java)
		-- This is the step that fixes the "No configuration found" error
		require("jdtls.dap").setup_dap_main_class_configs()

		-- 3. Load vscode-style launch.json if it exists in the project
		require("jdtls.setup").add_configs()
	end,
}

-- 4. Keymaps (Which-Key)
local wk = require("which-key")

-- 5. Start or Attach
jdtls.start_or_attach(config)

-- DAP Fallback config
local dap = require("dap")
dap.configurations.java = {
	{
		type = "java",
		request = "launch",
		name = "Fallback Debug (Attach) - Remote",
		hostName = "127.0.0.1",
		port = 5005,
	},
}
