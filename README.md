# reverberationz
a thing 4 my friendz

## install
```bundle install```

## test
```bundle exec rspec specs``` 

## mount
```bundle exec rackup```

## post-dev thoughts
- Should have decided which class would be responsible for date conversions much sooner, could be cleaner
- I initially wrote it all using redis instead of a flat file. (whoops) Shoulda read the instructions a bit closer. Thankfully it was a fairly clean switch. There might be some remnants of it somewhere though...
- I would rather use the Customer#generate_random method than use the fixtures for unit test data, but I didn't write it until fairly late into the project. Still works. /shrug
- Grape is p cool. Probably the easiest part of the project even though I'd not used it. 
