#module Pinion
  ## A `Bundle` is a set of assets of the same type that will be served as a single grouped asset in
  ## production. New types of `Bundle`s may be created with `Bundle.create`. A particular bundle type is simply
  ## a Proc that knows how to bundle together a set of assets. For convenience, there is a built-in `Bundle`
  ## type already defined, `:concatenate_and_minify_js`
  #class Bundle
    #class << self
      #attr_accessor :
    #end
    #def initialize(bundle_type, assets)

    #end

    #def self.create(name, &block)

    #end
  #end
#end
