class GroceryPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    user.present?
  end

  def update?
    return true if user.present? && user == item.user
  end

  def destroy?
    return true if user.present? && user == item.user
  end

  private

    def item
      record
    end
  end
