# reverberationz
mostly an excuse to play with grape api and get in the always-neccessary modeling puzzles 

also I listened to Nine Inch Nails's The Fragile the whole time I was writing this and I feel a little bit crazy now 

## install
```bundle install```

## test
```bundle exec rspec specs``` 

## mount
```bundle exec rackup```

## api
```get /api/customers/```

```get /api/customers/?sort=gender```

```get /api/customers/?sort=lname```

```get /api/customers/?sort=dob```

```post /api/customers/```

## post-dev thoughts
- Should have decided which class would be responsible for date conversions much sooner, could be cleaner
- I initially wrote it all using redis instead of a flat file. (whoops) Shoulda read the instructions a bit closer. Thankfully it was a fairly clean switch. There might be some remnants of it somewhere though...
- I would rather use the Customer#generate_random method than use the fixtures for unit test data, but I didn't write it until fairly late into the project. Still works. /shrug
- Gender is a string by intention.
- Grape is p cool. Probably the easiest part of the project even though I'd not used it. 
- I would prefer make the sorting dynamic + add pagination. So the interface is at least written to where it wouldn't need to be changed as a result. 
- If I could justify additional time spent refactoring, I'd start at the csv_parser.
- Actually I would absolutely not because who the hell uses CSV files anymore?? 
- DOWN WITH CSV 
- UP WITH JSON 
- ...yeah yeah yeah I know the legacy app makes a lot of money. I didn't mean to start this conversation. 
