-- Author: karateSwag
-- Repo: https://github.com/karateswag/dotfiles

require('fluoromachine').setup({
  glow = true,
  theme = 'retrowave',
  transparent = 'full',
  colors = function(_, d)
    return {
      comment = '#a4a9ca',
    }
  end,
})

function myTheming() 
  color = color or "fluoromachine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

myTheming()
