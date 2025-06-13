require "test_helper"

class GistTest < ActiveSupport::TestCase
  test "languages returns up to three capitalized languages" do
    user = User.create!(username: "tester", email: "tester@example.com")
    gist = Gist.new(user: user)
    gist.files.build(filename: "a.rb", language: "ruby", content: "puts")
    gist.files.build(filename: "b.rb", language: "ruby", content: "puts")
    gist.files.build(filename: "c.py", language: "python", content: "print")
    gist.files.build(filename: "d.js", language: "javascript", content: "console.log")
    gist.save!

    assert_equal ["Ruby", "Python", "Javascript"], gist.languages
  end
end
