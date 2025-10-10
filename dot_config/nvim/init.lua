-- Load genreal config
require("options")

-- Load lazy.nvim
require("config.lazy")

-- Load keymap after lazy in order to access which-key module
require("keymap")

-- Load scripts
require("scripts")
