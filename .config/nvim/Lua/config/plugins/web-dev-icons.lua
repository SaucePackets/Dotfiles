return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        require("nvim-web-devicons").set_icon({
            find = {
                icon = "",
                color = "#e535ab",
                cterm_color = "199",
                name = "GraphQL",
            },
        })
    end,
}
