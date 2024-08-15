local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Mapeo para el comando :Stdheader con la tecla <F1>, hacer un salto de línea y activar modo INSERT.
function InsertHeaderWithNewline()
  vim.cmd('Stdheader')
  vim.cmd('normal! o')
  vim.cmd('startinsert')
end

keymap('n', '<F1>', ':lua InsertHeaderWithNewline()<CR>', opts)
                                                          -- Mapeo F2 está asignado a 42 Formatter.
keymap('n', '<F3>', ':Norminette<CR>', opts)              -- Mapear F3 para ejecutar Norminette
keymap('n', '<F4>', ':q<CR>', opts)                       -- Mapear F4 para cerrar la ventana actual
keymap('n', '<F5>', ':w<CR>', opts)                       -- Mapear F5 para guardar el documento actual
keymap('n', '<F6>', ':NERDTreeToggle<CR>', opts)          -- Mapear F6 para mostrar el explorador NERDTree en la ruta actual
keymap('n', '<F7>', ':TagbarToggle<CR>', opts)            -- Mapear F7 para mostrar los tags a la derecha
keymap("n", "ss", ":split<CR><C-w>w", opts)               -- Open a horizontal split.
keymap("n", "sv", ":vsplit<CR><C-w>w", opts)              -- Open a vertical split.
keymap('n', '<C-Up>', ':resize -2<CR>', opts)             -- Resize Up (Horizontal)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)           -- Resize Down (Horizontal)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)  -- Resize Left (Vertical)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts) -- Resize Right (Vertical)
