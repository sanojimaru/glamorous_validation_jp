require 'mail'

module ActiveModel
  module Validations
    class EmailValidator < ActiveModel::EachValidator
      def initialize(options)
        super(options.reverse_merge(allow_blank: false))
      end

      def validate_each(record, attr_name, value)
        unless value
          record.errors.add(attr_name, :not_a_email, options) unless options[:allow_blank]
          return
        end

        record.errors.add(attr_name, :not_a_email, options) unless valid_email(value)
      end

      private
      def valid_email( value )
        begin
          return false if value == ''
          parsed = Mail::Address.new( value )
          return parsed.address == value && parsed.local != parsed.address
        rescue Mail::Field::ParseError
          return false
        end
      end
    end
  end
end
