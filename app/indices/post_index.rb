ThinkingSphinx::Index.define :post, with: :active_record do
  indexes :full
  indexes :title
  indexes :intro
end