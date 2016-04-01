# GOTCHA: this file is an exclusion from rule or plain module definition, because
#   it is used in rbcom-common.gemspec file where all root namespaces
#   do not loaded. So, they have to be defined hierarchically.
module ::Rbcom
  module Common
    # Library version.
    #
    # @return [String] library version
    VERSION = "0.1.0".freeze
  end
end
