FactoryBot.define do
  factory :user do
    nickname              { 'テスト用ユーザー' }
    email                 { Faker::Internet.free_email }
    password =            'test1234'
    password              { password }
    password_confirmation { password }
    family_name           { '佐藤' }
    first_name            { '太郎' }
    family_name_kana      { 'サトウ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1970-01-01' }
  end
end
