class ImplementationsController < InheritedResources::Base
  actions :show, :new, :create, :edit, :update
  belongs_to :post, :singleton => true
end
