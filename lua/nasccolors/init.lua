local specs = require('nasccolors.specs')
local palettes = require('nasccolors.palettes')
local M = {}

--- Resets the current colorscheme and.
--- @param variant ColorVariant | nil The color variant being used.
local function reset_theme(variant)
  if vim.g.colors_name then
    vim.cmd('hi clear')
  end
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end
  local cname = 'nasccolors'
  if variant then
    cname = string.format('%s-%s', cname, variant)
    vim.o.background = variant
  end
  vim.g.colors_name = cname
  vim.o.termguicolors = specs.termguicolors
end

--- Loads the colorscheme based on a given color variant.
--- @param variant ColorVariant | nil The color variant to be set
M.load = function(variant)
  -- set runtime values
  reset_theme(variant)
  variant = variant or vim.o.background
  palettes.get_palette(variant)
end

return M
