---@diagnostic disable: unused-local, unused-function, undefined-field

-- Basic configuration
require("ufo").setup {
  preview = {
    mappings = {
      scrollB = "<ScrollWheelUp>",
      scrollF = "<ScrollWheelDown>",
    },
  },
}

-- Key mappings
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Optional configurations (commented out)

-- -- Customize fold text
-- local handler = function(virtText, lnum, endLnum, width, truncate)
--     -- Your custom fold text handler here
-- end
-- require('ufo').setup({
--     fold_virt_text_handler = handler
-- })

-- -- Customize provider selector
-- local function selectProviderWithFt()
--     -- Your custom provider selector here
-- end
-- require('ufo').setup({
--     provider_selector = selectProviderWithFt
-- })

-- -- Enable get fold virt text
-- require('ufo').setup({
--     enable_get_fold_virt_text = true
-- })

-- -- Customize preview window
-- require('ufo').setup({
--     preview = {
--         win_config = {
--             border = {'', '─', '', '', '', '─', '', ''},
--             winhighlight = 'Normal:Folded',
--             winblend = 0
--         }
--     }
-- })
