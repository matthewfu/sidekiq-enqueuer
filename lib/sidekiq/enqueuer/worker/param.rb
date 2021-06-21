module Sidekiq
  module Enqueuer
    module Worker
      class Param
        attr_reader :name, :label
        attr_accessor :value
        attr_accessor :default_value_for_opt_field

        VALID_OPTIONS = { req: 'required', opt: 'optional' }.freeze

        def initialize(name, label, job_klass)
          @name = name
          @label = VALID_OPTIONS[label]
          @default_value_for_opt_field = if @name.present?
            job_klass.has_default_value_for_ui?(name.to_sym) ? job_klass.get_default_value_for_ui(name.to_sym) : nil
          end
        end

        def required?
          label == VALID_OPTIONS[:req]
        end

        def optional?
          !required?
        end
      end
    end
  end
end
