class Gist::File < ApplicationRecord
  belongs_to :gist

  before_validation :set_filename, if: ->(file) { file.filename.blank? }

  validates :content, presence: {message: "File contents can't be empty"}
  validates :filename, uniqueness: {scope: :gist_id, message: "Filenames must be unique"}

  private

  def set_filename
    self.filename = "gistfile#{gist.files.size}.txt"
  end
end
