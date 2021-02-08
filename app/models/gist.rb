class Gist < ApplicationRecord
  belongs_to :user
  has_many :files, dependent: :destroy

  accepts_nested_attributes_for :files, reject_if: :all_blank, allow_destroy: true

  validates :files, length: { minimum: 1, message: 'You need to have at least a file with content.' }
  validates :files, length: { maximum: 10, message: 'Gists can only have upto 10 files.' }

  before_create :set_ulid

  def languages
    files.group("language").count.max(3).map(&:first).reject { |l| l == "null" }.map(&:capitalize)
  end

  private

  def set_ulid
    self.id = ULID.generate
  end
end
