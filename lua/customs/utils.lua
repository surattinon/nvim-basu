local blend = 70

-- NOTE: Dim backdrop for Telescope
vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function(ctx)
    local backdropName = "TelescopeBackdrop"
    local telescopeBufnr = ctx.buf

    local telescopeZindex = 50

    local backdropBufnr = vim.api.nvim_create_buf(false, true)
    local winnr = vim.api.nvim_open_win(backdropBufnr, false, {
      relative = "editor",
      row = 0,
      col = 0,
      width = vim.o.columns,
      height = vim.o.lines,
      focusable = false,
      style = "minimal",
      zindex = telescopeZindex - 1,
    })

    vim.api.nvim_set_hl(0, backdropName, { bg = "#000000", default = true })
    vim.wo[winnr].winhighlight = "Normal:" .. backdropName
    vim.wo[winnr].winblend = blend
    vim.bo[backdropBufnr].buftype = "nofile"

    -- close backdrop when the reference buffer is closed
    vim.api.nvim_create_autocmd({ "WinClosed", "BufLeave" }, {
      once = true,
      buffer = telescopeBufnr,
      callback = function()
        if vim.api.nvim_win_is_valid(winnr) then
          vim.api.nvim_win_close(winnr, true)
        end
        if vim.api.nvim_buf_is_valid(backdropBufnr) then
          vim.api.nvim_buf_delete(backdropBufnr, { force = true })
        end
      end,
    })
  end,
})

-- NOTE: Dim backdrop for Mason
vim.api.nvim_create_autocmd("FileType", {
  pattern = "mason",
  callback = function(ctx)
    local backdropName = "MasonBackdrop"
    local masonBufnr = ctx.buf

    local masonZindex = 50

    local backdropBufnr = vim.api.nvim_create_buf(false, true)
    local winnr = vim.api.nvim_open_win(backdropBufnr, false, {
      relative = "editor",
      row = 0,
      col = 0,
      width = vim.o.columns,
      height = vim.o.lines,
      focusable = false,
      style = "minimal",
      zindex = masonZindex - 1,
    })

    vim.api.nvim_set_hl(0, backdropName, { bg = "#000000", default = true })
    vim.wo[winnr].winhighlight = "Normal:" .. backdropName
    vim.wo[winnr].winblend = blend
    vim.bo[backdropBufnr].buftype = "nofile"

    -- close backdrop when the reference buffer is closed
    vim.api.nvim_create_autocmd({ "WinClosed", "BufLeave" }, {
      once = true,
      buffer = masonBufnr,
      callback = function()
        if vim.api.nvim_win_is_valid(winnr) then
          vim.api.nvim_win_close(winnr, true)
        end
        if vim.api.nvim_buf_is_valid(backdropBufnr) then
          vim.api.nvim_buf_delete(backdropBufnr, { force = true })
        end
      end,
    })
  end,
})

-- NOTE: Dim backdrop for Oil
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function(ctx)
    local backdropName = "OilBackdrop"
    local oilBufnr = ctx.buf

    local oilZindex = 40

    local backdropBufnr = vim.api.nvim_create_buf(false, true)
    local winnr = vim.api.nvim_open_win(backdropBufnr, false, {
      relative = "editor",
      row = 0,
      col = 0,
      width = vim.o.columns,
      height = vim.o.lines,
      focusable = false,
      style = "minimal",
      zindex = oilZindex - 1,
    })

    vim.api.nvim_set_hl(0, backdropName, { bg = "#000000", default = true })
    vim.wo[winnr].winhighlight = "Normal:" .. backdropName
    vim.wo[winnr].winblend = blend
    vim.bo[backdropBufnr].buftype = "nofile"

    -- close backdrop when the reference buffer is closed
    vim.api.nvim_create_autocmd({ "WinClosed", "BufLeave" }, {
      once = true,
      buffer = oilBufnr,
      callback = function()
        if vim.api.nvim_win_is_valid(winnr) then
          vim.api.nvim_win_close(winnr, true)
        end
        if vim.api.nvim_buf_is_valid(backdropBufnr) then
          vim.api.nvim_buf_delete(backdropBufnr, { force = true })
        end
      end,
    })
  end,
})
