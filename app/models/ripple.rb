class Ripple < ActiveRecord::Base
validates :name, :message, presence: true

end
