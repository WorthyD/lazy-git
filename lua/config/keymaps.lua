-- This file is automatically loaded by lazyvim.plugins.config
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({
        lhs,
        mode = mode
    }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", {
    desc = "Go to left window"
})
map("n", "<C-j>", "<C-w>j", {
    desc = "Go to lower window"
})
map("n", "<C-k>", "<C-w>k", {
    desc = "Go to upper window"
})
map("n", "<C-l>", "<C-w>l", {
    desc = "Go to right window"
})

map("n", "<C-Tab>", "<C-d>zz", {
    desc = ""
})

map("n", ",h", "<C-w>h", {
    desc = "Go to left window"
})
map("n", ",j", "<C-w>j", {
    desc = "Go to lowwer window"
})
map("n", ",k", "<C-w>k", {
    desc = "Go to upper window"
})
map("n", ",l", "<C-w>l", {
    desc = "Go to right window"
})

-- Re-centers screen after use.
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("i", "jj", "<Esc>")

map("x", "<leader>p", "\"_dP", {
    desc = "Proper Paste"
})

-- Tabs
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", {
    desc = "Next Tab"
})
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", {
    desc = "Previous Tab"
})

if Util.has("neotree.nvim") then
    map("n", "o", "<2-LeftMouse>", {
        desc = "Open"
    })
end

local opts = {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = false
}
-- vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
--     opts)
-- vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
vim.keymap.set("i", "<Tab>", [[pumvisible() ? (complete_info().selected == -1 ? "<C-e><Tab>" : "<C-y>") : "<TAB>"]], {silent = true})