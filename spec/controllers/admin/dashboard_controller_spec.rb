require 'rails_helper'

describe Admin::DashboardController do
  it_behaves_like 'an authenticated controller', 'index'
end
