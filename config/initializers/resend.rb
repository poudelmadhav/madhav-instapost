Resend.api_key = ENV.fetch("RESEND_API_KEY", 'resend-api-key-not-set')

# Rails 5.1 + mail 2.7 compatibility for Resend adapter
begin
  mail_spec = Gem.loaded_specs['mail']
  if mail_spec && mail_spec.version < Gem::Version.new('2.8.0')
    module Mail
      class Field
        # Provide unparsed_value expected by resend adapter on Mail < 2.8
        def unparsed_value
          if respond_to?(:value)
            value
          else
            to_s
          end
        end
      end
    end
  end
rescue StandardError
  # Fail-safe: do not prevent boot if gem/version checks error
end
