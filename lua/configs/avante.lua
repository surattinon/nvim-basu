local M = {}

M.providers = {
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-3.5-turbo-0125", -- your desired model (or use gpt-4o, etc.)
    timeout = 30000, -- timeout in milliseconds
    extra_request_body = {
      temperature = 0,
      max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    },
  },
}

return M
