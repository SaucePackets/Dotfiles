return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"leoluz/nvim-dap-go",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		"fredrikaverpil/neotest-golang",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		require("dapui").setup()
		require("dap-go").setup()

		-- Dap UI
		vim.keymap.set("n", "<leader>de", function()
			require("dapui").eval()
		end)
		vim.keymap.set("n", "<leader>du", function()
			require("dapui").toggle({})
		end)

		-- Dap
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>dc", dap.continue)
		vim.keymap.set("n", "<leader>di", dap.step_into)
		vim.keymap.set("n", "<leader>dO", dap.step_over)
		vim.keymap.set("n", "<leader>do", dap.step_out)
		vim.keymap.set("n", "<leader>dp", dap.step_back)
		vim.keymap.set("n", "<leader>dr", dap.restart)
		vim.keymap.set("n", "<leader>dt", dap.terminate)

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
