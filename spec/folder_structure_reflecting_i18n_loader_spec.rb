#encoding: utf-8
require 'spec_helper'

require_relative '../lib/folder_structure_reflecting_i18n_loader'


describe FolderStructureReflectingI18nLoader::Loader do


  example do
    i18n_root = Pathname File.expand_path File.dirname(__FILE__) + '/../example/'
    I18n.backend = FolderStructureReflectingI18nLoader::Backend.new(i18n_root)

    I18n.reload!

    expect(I18n.t( 'music.artists.best')).to eq 'Chris Clark'

    I18n.with_locale 'ru' do
      expect(I18n.t( 'music.artists.best')).to eq 'Григорий Лепс'
    end
  end
end
