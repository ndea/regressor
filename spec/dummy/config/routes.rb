Rails.application.routes.draw do

  mount RegressorDummy::Engine => "/regressor_dummy"
end
