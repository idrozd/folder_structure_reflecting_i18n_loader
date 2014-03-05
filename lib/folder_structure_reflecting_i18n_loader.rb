require "folder_structure_reflecting_i18n_loader/version"

module FolderStructureReflectingI18nLoader

  class Backend < I18n::Backend::Simple

    attr_reader :root

    def initialize root = (Rails.root.join( *%w(app views)))
      @root = root
    end

    def load_translations
      Loader.new( root).load{|locale, data| store_translations locale, data}
    end
  end




  class Loader

    attr_reader :root

    def initialize root
      @root    = root
    end


    def load &block
      filepaths = Dir[root + '**/*.yml']

      locale_and_data =
        filepaths.map do |filepath|
          c = ContextExtractor.new(filepath, root)

          [c.locale, c.data]
        end

      locale_and_data.each do |locale, data|
        yield locale, data
      end
    end


  end


  class ContextExtractor
    PREFIX = 't.'.freeze

    attr_reader :filepath, :root, :prefix

    def initialize filepath, root, prefix = PREFIX
      @filepath = filepath
      @root     = root
      @prefix   = prefix
    end


    def dirs
      filepath.
        sub( root.to_s, '').
        sub( '/' + prefix, '/').
        sub( '.yml', '').
        split( '/').
        reject(&:empty?)
    end


    def locale
      dirs.last
    end


    def data
      dirs[0...-1].
          reverse.
          unshift( content).
          inject{|subcontext, key| {key => subcontext} }
    end


    def content
      YAML.load_file  filepath
    end

  end


end
