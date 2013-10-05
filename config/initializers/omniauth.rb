GITHUB_KEY = '2b353c54337c0cb1418d'

GITHUB_SECRET =  'b2e25edee22b2cf540b61864f7ca745bfa26cae6'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, GITHUB_KEY, GITHUB_SECRET
end
