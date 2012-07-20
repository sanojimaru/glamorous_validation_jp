require 'spec_helper'

valid_emails = %w(
  abc@example
  Abc@example.com
  Abc.123@example.com
  user+mailbox/department=shipping@example.com
  !#$%&'*+-/=?^_`.{|}~@example.com
  "Abc@def"@example.com
  "Fred\ Bloggs"@example.com
  "Joe.\\Blow"@example.com
  abc@127.0.0.1
)

invalid_emails = %w(
  Abc.@example.com
  .@example.com
  abc@example,com
  abc@ex:ample.com
  <abc@example.com>
  abc;@exam
)

class Test1 < TestModel
  validates :email, email: true
end

describe ActiveModel::Validations::EmailValidator do
  describe :validation do
    context :valid do
      valid_emails.each do |email|
        it "#{email} should be valid" do
          Test1.new(email: email).should be_valid
        end
      end
    end

    context :invalid do
      invalid_emails.each do |email|
        it "#{email} no should be valid" do
          Test1.new(email: email).should_not be_valid
        end
      end
    end
  end
end
