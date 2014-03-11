# How this was born?

Consider multilingual app with content-heavy static pages:

app/views/pages/faq.html.slim:
```slim
h2 '.question-1'
p  '.answer-1'
/...

h2 = t '.question-20'
p  = t '.answer-20'
```

## Translation with default i18n loader:

config/locales/en.yml
```yaml
en:
  pages:
    faq:
      question-1: What?
      answer-1:   That
      #...
```

config/locales/de.yml
```yaml
en:
  pages:
    faq:
      question-1: Was?
      answer-1:   Das
      #...
```
...

## Translation with folder_structure_reflecting_i18n_loader
app/views/pages/t.faq/en.yml
```yaml
question-1: What?
answer-1:   That
#...
```

app/views/pages/t.faq/de.yml
```yaml
question-1: Was?
answer-1:   Das
#...
```


## Profit?

1. Easier to move files (with their translations)
2. Intuitive 


## Installation

Add this line to your application's Gemfile:

    gem 'folder_structure_reflecting_i18n_loader'

And then execute:

    $ bundle

With Rails, update config/application.rb:

    I18n::Railtie.reloader_paths.concat  Dir.glob('app/views/**/*.yml')

    I18n.backend = I18n::Backend::Chain.new(I18n.backend,  FolderStructureReflectingI18nLoader::Loader.new) # Rails.root + app/views is default root for it
    
    
# TODO:

1. Add rails example / specs



## Contributing

1. Fork it ( http://github.com/<my-github-username>/folder_structure_reflecting_i18n_loader/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
