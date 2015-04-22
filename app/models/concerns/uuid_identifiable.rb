module UuidIdentifiable
  extend ActiveSupport::Concern

  included do
    before_create :set_uuid
  end

  def set_uuid
    self.token = SecureRandom.uuid
  end
end
