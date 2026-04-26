return {
  {
    'okuuva/auto-save.nvim',
    opts = {
      trigger_events = {
        immediate_save = { 'BufLeave', 'FocusLost', 'QuitPre', 'VimSuspend' },
        -- Save after you leave insert mode so typing a newline does not trigger
        -- a format/save cycle while you are still writing the next line.
        defer_save = { 'InsertLeave' },
        cancel_deferred_save = { 'InsertEnter' },
      },
      debounce_delay = 300,
    },
  },
}
