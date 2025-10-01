--------- general idea of key mapping: --------

-- Define group names
local wk = require("which-key")
wk.add({
	{ "<leader>g", group = "Git" },
	{ "<leader>f", group = "Find" },
	{ "<leader>w", group = "Window" },
	{ "<leader>e", group = "Explorer" },
	-- TODO: { "<leader>t", group = "Tabs" },
	{ "<leader>s", group = "Editor settings" },
	{ "<leader>b", group = "Buffers" },
	{ "<leader>x", group = "Trouble.nvim" },
	{ "<leader>c", group = "File Specific" },
	{ "<leader>a", group = "Avante" },
})

-----------------------------------------------

-- set leader key to space
vim.g.mapleader = " "
local map = vim.keymap.set

-- encourage hjkl keys
local function warn_arrow_key()
	print("Use hjkl instead!")
end

vim.keymap.set("", "<Up>", warn_arrow_key, { desc = "Discourage arrow key use" })
vim.keymap.set("", "<Down>", warn_arrow_key, { desc = "Discourage arrow key use" })
vim.keymap.set("", "<Left>", warn_arrow_key, { desc = "Discourage arrow key use" })
vim.keymap.set("", "<Right>", warn_arrow_key, { desc = "Discourage arrow key use" })

-- Custom Vim Commands
map(
	"n",
	"o",
	"$a<CR><Tab><BS><Esc>",
	{ noremap = true, silent = true, desc = "Insert line above without entering Editor mode" }
)
map(
	"n",
	"O",
	"0i<CR><Esc>k",
	{ noremap = true, silent = true, desc = "Insert line below without entering Editor mode" }
)
map("n", "cr", vim.lsp.buf.rename, { noremap = true, silent = true, buffer = bufnr, desc = "Rename (LSP)" })
map("i", "<S-Tab>", "<C-d>")

-- LSP Go commands
map(
	"n",
	"gd",
	"<cmd>Telescope lsp_definitions<cr>",
	{ noremap = true, silent = true, buffer = bufnr, desc = "Go to definition" }
)
map(
	"n",
	"gI",
	"<cmd>Telescope lsp_implementations<cr>",
	{ noremap = true, silent = true, buffer = bufnr, desc = "Go to implementation" }
)
map(
	"n",
	"gr",
	"<cmd>Telescope lsp_references<cr>",
	{ noremap = true, silent = true, buffer = bufnr, desc = "Go to references" }
)

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- nvimtree
map("n", "<leader>ee", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<leader>ex", "<cmd>NvimTreeClose<CR>", { desc = "nvimtree close" })

-- terminal
map("t", "<Esc>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("n", "<leader>wt", "<cmd>:ToggleTerm direction=horizontal<CR>", { desc = "New horizontal terminal" })
map("n", "<leader>ws", "<cmd>:ToggleTerm direction=vertical<CR>", { desc = "New vertical terminal" })
map("t", "<esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { noremap = true, silent = true })
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { noremap = true, silent = true })
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { noremap = true, silent = true })
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { noremap = true, silent = true })

-- windows & window navigation
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>wx", ":close<CR>", { desc = "Close current splitted window" })

map("n", "<leader>w0", "<C-w>=", { desc = "Reset splitted window width / height" })

map("n", "<leader>w1", ":vertical resize +10<CR>", { desc = "Increase width of splitted window" })
map("n", "<leader>w2", ":vertical resize -10<CR>", { desc = "Decrease width of splitted window" })
map("n", "<leader>w3", ":resize +5<CR>", { desc = "Increase height of splitted window" })
map("n", "<leader>w4", ":resize -5<CR>", { desc = "Decrease height of splitted window" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- buffer navigation navigation
map("n", "<leader>bb", ":enew<CR>", { desc = "Open new buffer" })
map("n", "<leader>bx", ":bp|bd #<CR>", { desc = "Close buffer", silent = true })
map("n", "<leader>bco", ":BufferLineCloseOthers<CR>", { desc = "Close all other buffers" })
map("n", "<leader>bcr", ":BufferLineCloseRight<CR>", { desc = "Close all buffers to the right" })
map("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", { desc = "Close all buffers to the left" })
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true }) -- Go to next buffer
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true }) -- To go previous buffer

-- editor settings

map("n", "<leader>st", "<cmd>ToggleTabwidth<CR>", { desc = "Toggle Tabwidth" })
map("n", "<leader>sr", "<cmd>ClearRegisters<CR>", { desc = "Clear Registers" })
map("n", "<leader>sf", "<cmd>ToggleAutoFormat<CR>", { desc = "Toggle auto-formatting" })
map("n", "<leader>ss", "<cmd>ToggleAutoSave<CR>", { desc = "Toggle autosave" })

wk.add({
	{ "<leader>sd", group = "Display settings" },
})
map("n", "<leader>sdw", ":set wrap!<CR>", { desc = "Toggle line wrapping" })
map("n", "<leader>sdt", "<cmd>Themery<CR>", { desc = "Change theme" })
map("n", "<leader>sdn", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>sdr", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })
map("n", "<leader>sdz", "<cmd>NoNeckPain<CR>", { desc = "Center currently focued buffer" })

-- Git
map("n", "<leader>gl", "<cmd>LazyGit<cr>", { desc = "Open lazy git" }) -- also configured with plugin
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle git blame" })
map("n", "<leader>gD", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>gm", "<cmd>Telescope notifications<CR>", { desc = "telescope git status" })

-- File Specific
map("n", "<leader>cf", "<cmd>Format<CR>", { desc = "Format file" })
map("n", "<leader>cF", "<cmd>FormatWrite<CR>", { desc = "Format and Save file" })

-- trouble
map("n", "<leader>xd", "<cmd>Trouble diagnostics focus<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics close<cr>", { desc = "Close Buffer Diagnostics" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
	"n",
	"<leader>xl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
map("n", "<leader>l", "<cmd>:lua vim.lsp.buf.code_action()<cr>", { desc = "Code actions list" })
map("n", "<leader>1", vim.diagnostic.open_float, { desc = "Show diagnostic popup" })
