class Muppet < ActiveRecord::Base
  belongs_to :users

  def slug
    self.name.downcase.gsub(" ", "-") + self.id.to_s
  end

  def self.find_by_slug(slug)
    self.all.find { |muppet| muppet.slug == slug }
  end
end
