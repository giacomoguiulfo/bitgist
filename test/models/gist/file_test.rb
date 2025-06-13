require "test_helper"

class Gist::FileTest < ActiveSupport::TestCase
  test "filename is generated when blank" do
    user = User.create!(username: "user2", email: "user2@example.com")
    gist = Gist.new(user: user)
    file = gist.files.build(content: "test")
    gist.save!

    assert_match /^gistfile\d+\.txt$/, file.filename
  end

  test "filename must be unique per gist" do
    user = User.create!(username: "user3", email: "user3@example.com")
    gist = Gist.create!(user: user, files: [Gist::File.new(filename: "a.txt", content: "one")])
    duplicate = gist.files.build(filename: "a.txt", content: "two")
    assert_not duplicate.save
    assert_includes duplicate.errors[:filename], "Filenames must be unique"
  end
end
