class Search < ActiveRecord::Base
  def search_wines

   wines = Wine.all

   wines = wines.where("name like ?", "%#{keywords}%") if keywords.present?
   wines = wines.where("category like ?", category) if category.present?
   wines = wines.where("price >= ?", min_price) if min_price.present?
   wines = wines.where("price <= ?", max_price) if max_price.present?

   return wines
end
end
