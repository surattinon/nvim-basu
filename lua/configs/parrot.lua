require("parrot").setup {
  -- Providers must be explicitly added to make them available.
  providers = {
    github = {
      api_key = os.getenv "GITHUB_TOKEN",
    },
  },
}
