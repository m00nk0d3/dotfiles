---@diagnostic disable: lowercase-global
ignore = {
  "111", -- seting non-standard global variable
  "212/_.*", -- unused argument, for vars with "_" prefix
  "214", -- used variable with unused hint
  "121", -- setting read-only global variable
  "122", -- assigning to read-only global variable
}

read_globals = {
  "vim",
}
