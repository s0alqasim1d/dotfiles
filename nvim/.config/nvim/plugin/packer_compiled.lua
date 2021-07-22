-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\AlQasim\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\AlQasim\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\AlQasim\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\AlQasim\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\AlQasim\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["calvera-dark.nvim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\calvera-dark.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dashboard-nvim"
  },
  ["fromthehell.vim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fromthehell.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins/statusline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim"
  },
  ["lampaces-demon-vim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lampaces-demon-vim"
  },
  ["landscape.vim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\landscape.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-status.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim"
  },
  ["material.vim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\material.vim"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neoscroll.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\ne\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\17show_numbers\2\16number_only\1\20show_cursorline\2\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\numb.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins/bufferline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\thtml\1\0\1\tmode\15foreground\1\3\0\0\bcss\15javascript\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons"
  },
  ["nvim-whichkey-setup.lua"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-whichkey-setup.lua"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim"
  },
  spacecamp = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\spacecamp"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\2\nü\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\16pulse_fader\1\0\5\rdelay_ms\3\n\nwinhl\nPMenu\nwidth\3\n\nblend\3\n\vinc_ms\3\n\1\0\2\rmin_jump\3\n\15show_jumps\2\nsetup\nspecs\frequire\0" },
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\specs.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  ["tender.vim"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tender.vim"
  },
  ["vim-afterglow"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-afterglow"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-be-good"
  },
  ["vim-colorscheme-primary"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-colorscheme-primary"
  },
  ["vim-detailed"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-detailed"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-maximizer"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-moonfly-colors"
  },
  ["vim-one"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-one"
  },
  ["vim-test"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-test"
  },
  ["vim-ultest"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-ultest"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-visual-multi"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "C:\\Users\\AlQasim\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-which-key"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\thtml\1\0\1\tmode\15foreground\1\3\0\0\bcss\15javascript\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins/statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\2\nü\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\16pulse_fader\1\0\5\rdelay_ms\3\n\nwinhl\nPMenu\nwidth\3\n\nblend\3\n\vinc_ms\3\n\1\0\2\rmin_jump\3\n\15show_jumps\2\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\ne\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\17show_numbers\2\16number_only\1\20show_cursorline\2\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins/bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
