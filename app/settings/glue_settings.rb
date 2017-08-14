class GlueSettings < Settingslogic
  source Rails.root.join('config/glue_settings.yml')
  namespace Rails.env
end
