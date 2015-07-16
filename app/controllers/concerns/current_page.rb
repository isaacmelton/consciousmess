module CurrentPage
extend ActiveSupport::Concern

private

def set_page
@page = Ripple.find(session[:page])
rescue ActiveRecord::RecordNotFound
session[:page] = 0

end
end
