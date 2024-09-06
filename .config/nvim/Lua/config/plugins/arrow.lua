-- if true then return {} end
return {
	"otavioschwanck/arrow.nvim",
	opts = {
		show_icons = true,
		leader_key = ";", -- Recommended to be a single key
		buffer_leader_key = "m", -- Per Buffer Mappings
	},
	-- config = function()
	-- 	require("lualine").setup({
	-- 		sections = {
	-- 			lualine_b = {
 --          require('arrow.statusline').is_on_arrow_file(),
 --          require('arrow.statusline').text_for_statusline(),
 --          require('arrow.statusline').text_for_statusline_with_icons(),
 --        },
	-- 		},
	-- 	})
	-- end,
}
