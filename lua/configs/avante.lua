local M = {
  provider = "openai",
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-3.5-turbo-0125", -- your desired model (or use gpt-4o, etc.)
    timeout = 30000, -- timeout in milliseconds
    temperature = 0, -- adjust if needed
    max_tokens = 4096,
  },
}

return M
