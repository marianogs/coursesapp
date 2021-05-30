Rails.application.routes.draw do
  get 'dashboard/index',:defaults => { :format => 'json' }
end
