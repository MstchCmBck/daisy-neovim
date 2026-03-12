-- Do nothing unless we are on Windows
if vim.loop.os_uname().sysname ~= "Windows_NT" then
  return
end

-- Terminal should use pwsh with your profile
vim.opt.shell = "pwsh"
-- vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellcmdflag = string.format(
  "-NoLogo -ExecutionPolicy RemoteSigned -NoExit -Command \"& '%s';\"",
  vim.fn.expand("$PROFILE")
)
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
