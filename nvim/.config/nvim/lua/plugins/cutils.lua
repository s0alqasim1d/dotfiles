Dos2UnixSafePath = function(workdir)
	-- vim.pretty_print(workdir)
  workdir = string.gsub(workdir, ":", "")
  workdir = string.gsub(workdir, "\\", "/")
  workdir = string.gsub(workdir, "^ +| +$|( ) +", "\\1")
  workdir = "/" .. workdir
	-- vim.pretty_print(workdir)
  return workdir
end

return {
	Dos2UnixSafePath = Dos2UnixSafePath,
}
