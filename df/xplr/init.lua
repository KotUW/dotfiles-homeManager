version = '0.20.1'
local xplr = xplr

-- xpm (xplr) plugin manager

local home = os.getenv("HOME")
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
  },
  auto_install = true,
  auto_cleanup = true,
})

xplr.config.general.enable_recover_mode=true

