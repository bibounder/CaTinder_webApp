RailsAdmin.config do |config|
  config.current_user_method(&:current_user)

  config.authorize_with :cancan

  config.main_app_name = ['CaTinder']

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    # export # useless
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
