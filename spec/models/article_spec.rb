require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'should be invalid without a title' do
    article = Article.create(title: nil, content: Faker::Lorem.paragraph_by_chars(number: 100))
    expect(article).not_to be_valid
  end

  it 'should be invalid without content' do
    article = Article.create(title: 'This Is a Title', content: nil)
    expect(article).not_to be_valid
  end

  it 'should be invalid with a title less than 5 characters' do
    article = Article.create(title: Faker::Lorem.characters(number: 4), content: Faker::Lorem.paragraph_by_chars(number: 100))
    expect(article).not_to be_valid
  end

  it 'should be invalid with content less than 50 characters' do
    article = Article.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph_by_chars(number: 25))
    expect(article).not_to be_valid
  end

  it 'should be valid with title >= 5 characters and content >= 50 characters' do
    article = Article.create(title: Faker::Lorem.characters(number: 5), content: Faker::Lorem.paragraph_by_chars(number: 50))
    expect(article).to be_valid
  end
end
