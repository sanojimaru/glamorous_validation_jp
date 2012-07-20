require 'spec_helper'

ActiveRecord::Schema.define(:version => 1) do
  create_table :companies, :force => true do |t|
    t.column :name, :string
  end
end

class Company < ActiveRecord::Base
  has_many :users
end

describe GlamorousValidationJp do
  pending
end
