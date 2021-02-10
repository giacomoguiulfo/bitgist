# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def language(ext)
  case ext
  when ".rb"
    "ruby"
  when ".js"
    "javascript"
  when ".erb", ".html"
    "html"
  else
    "text/plain"
  end
end

user = User.first
Dir.glob("#{Rails.root}/app/**/*").each do |file|
  next unless File.file?(file)

  Gist.create!(
    public: [true, false].sample,
    user: user,
    description: Faker::Company.bs,
    files: [Gist::File.new(
      language: language(File.extname(file)),
      filename: file,
      content: IO.binread(file)
    )]
  )
end
