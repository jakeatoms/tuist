# frozen_string_literal: true

module Fourier
  module Utilities
    module SwiftLinter
      class << self
        def lint(directories:, fix: false)
          arguments = [
            File.join(Fourier::Constants::VENDOR_DIRECTORY, "swiftlint", "swiftlint"),
          ]
          if fix
            arguments << "autocorrect"
          else
            arguments << "lint"
          end
          arguments << "--quiet"
          arguments.concat(["--config", Constants::SWIFTLINT_CONFIG_PATH])
          arguments.concat(directories.flat_map { |p| ["--path", p] })
          Utilities::System.system(*arguments)
        end
      end
    end
  end
end
