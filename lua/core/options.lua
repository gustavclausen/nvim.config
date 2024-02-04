local o = vim.opt

o.termguicolors = true
o.relativenumber = true
o.number = true
o.cursorline = true
o.signcolumn = "yes"
o.completeopt = { "menu", "menuone", "noselect", "noinsert" }
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

o.ignorecase = true
o.smartcase = true

o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true
o.softtabstop = 2
o.wrap = false
o.binary = true
o.scrolloff = 999

o.clipboard:append("unnamedplus")
o.splitright = true
o.splitbelow = true
o.mouse = nil

o.wildignorecase = true
o.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]
