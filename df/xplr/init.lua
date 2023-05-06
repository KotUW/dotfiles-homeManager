version = '0.20.1'
local xplr = xplr
local home = os.getenv("HOME")
local key = xplr.config.modes.builtin.default.key_bindings.on_key

-- xpm (xplr) plugin manager

local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"
package.path = package.path
  .. ";"
  .. xpm_path
  .. "/?.lua;"
  .. xpm_path
  .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)
-- set up plugin manager
require("xpm").setup({
  plugins = {
    -- Let xpm manage itself
    'dtomvan/xpm.xplr',
    { name = 'sayanarijit/fzf.xplr' },
    -- 'sayanarijit/zentable.xplr',
    'prncss-xyz/icons.xplr',
    -- xplr file viewer and opener
    'Junker/nuke.xplr'
  },
  auto_install = true,
  auto_cleanup = true,
})

-- Setup plugins --
-- = nuke
require("nuke").setup()
key.v = {
  help = "nuke",
  messages = {"PopMode", {SwitchModeCustom = "nuke"}}
}
key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o

-- user config
xplr.config.general.enable_recover_mode=true
