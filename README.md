# reverberationz
mostly an excuse to play with grape api and get in the always-neccessary modeling puzzles 

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
- If I could justify additional time spent refactoring, I'd start at the csv_parser.
- Actually I would absolutely not because who the hell uses CSV files anymore?? 
- DOWN WITH CSV 
- UP WITH POSTING JSON 
- Are you telling me you have an ftp landing zone for csv files laying around?? And sometimes they use pipes?? 
- ...yeah yeah yeah I know the legacy app makes a lot of money. I didn't mean to start this conversation. 
- ...omg okay sure I suppose it might be a better choice if the file is especially large.
- I'm walking away now! You just keep talking to yourself! 
