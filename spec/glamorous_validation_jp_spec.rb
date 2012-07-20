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

class EmailTestModel < TestModel
  validates :email, email: true
end

class EmailTestModelAllowBlank < TestModel
  validates :email, email: true, allow_blank: true
end

class EmailTestModelNotAllowBlank < TestModel
  validates :email, email: true, allow_blank: false
end


describe ActiveModel::Validations::EmailValidator do
  context 'valid email addresses' do
    valid_emails.each do |email|
      it "#{email} should be valid" do
        EmailTestModel.new(email: email).should be_valid
      end
    end
  end

  context 'invalid email addresses' do
    invalid_emails.each do |email|
      it "#{email} no should be valid" do
        EmailTestModel.new(email: email).should_not be_valid
      end
    end

    context "if allow_blank is default" do
      it { EmailTestModel.new(email: '').should_not be_valid }
    end

    context "if not allow blank" do
      it { EmailTestModelNotAllowBlank.new(email: '').should_not be_valid }
    end

    context "if allow blank" do
      it { EmailTestModelAllowBlank.new(email: '').should be_valid }
    end
  end
end
