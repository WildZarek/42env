local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap

-- Mapeo para el comando :Stdheader con la tecla <F1>, hacer un salto de línea y activar modo INSERT.
function InsertHeaderWithNewline()
  vim.cmd('Stdheader')
  vim.cmd('normal! o')
  vim.cmd('startinsert')
end

keymap.set('n', '<F1>', ':lua InsertHeaderWithNewline()<CR>', opts)
                                                              -- Mapeo F2 está asignado a 42 Formatter.
keymap.set('n', '<F3>', ':Norminette<CR>', opts)              -- Mapear F3 para ejecutar Norminette
keymap.set('n', '<F4>', ':NERDTreeToggle<CR>', opts)          -- Mapear F4 para mostrar el explorador NERDTree en la ruta actual
keymap.set('n', '<F5>', ':TagbarToggle<CR>', opts)            -- Mapear F5 para mostrar los tags a la derecha
keymap.set('n', '<C-q>', ':q!<CR>', opts)                     -- Mapear Ctrl+q para cerrar la ventana actual
keymap.set('n', '<C-s>', ':w<CR>', opts)                      -- Mapear Ctrl+s para guardar el documento actual
keymap.set('n', '<C-f>', ':wq<CR>', opts)                     -- Mapear Ctrl+f para guardar y cerrar el documento actual
keymap.set('n', '<C-h>', '<C-w><C-h>', opts)                  -- Mapear Ctrl+h para movernos a la ventana izquierda
keymap.set('n', '<C-l>', '<C-w><C-l>', opts)                  -- Mapear Ctrl+l para movernos a la ventana derecha
keymap.set('n', '<C-j>', '<C-w><C-j>', opts)                  -- Mapear Ctrl+j para movernos a la ventana inferior
keymap.set('n', '<C-k>', '<C-w><C-k>', opts)                  -- Mapear Ctrl+k para movernos a la ventana superior
keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)             -- Mapear Ctrl+↑ para redimensionar la ventana activa hacia arriba (Horizontal)
keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)           -- Mapear Ctrl+↓ para redimensionar la ventana activa hacia abajo (Horizontal)
keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', opts)  -- Mapear Ctrl+← para redimensionar la ventana activa hacia la izquierda (Vertical)
keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', opts) -- Mapear Ctrl+→ para redimensionar la ventana activa hacia la derecha (Vertical)
