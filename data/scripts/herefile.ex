"For shell scripts, use a region to highlight herefiles.
color herefile like comment black or white
aug herefile
au OptChanged bufdisplay {
  if bufdisplay == "syntax sh" || knownsyntax(filename) == "sh"
  then try %s#<<\\\?\(\S\+\)#+,/^\\s*\1$/-region herefile \1#x
}
au BufDelete all try %unr herefile
aug END
