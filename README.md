# Stressfactor

[![Build
Status](https://travis-ci.org/andrewhao/stressfactor.svg)](https://travis-ci.org/andrewhao/stressfactor)
[![Code
Climate](https://codeclimate.com/github/andrewhao/stressfactor/badges/gpa.svg)](https://codeclimate.com/github/andrewhao/stressfactor)


Calculate workout intensity based on heart rate. Exploratory coding of
the Training Stress Score as detailed here:

* https://chris-lamb.co.uk/posts/estimating-training-stress-score-tss-running-strava
* http://home.trainingpeaks.com/blog/article/running-training-stress-score-rtss-explained

## Calculating the stressor score by run pace and normalized graded pace.

```ruby
(duration_seconds * normalized_graded_pace * intensity_factor) /
(functional_threshold_pace * 3600) * 100
```

### Define some terms:

`duration_seconds`: The length of the workout, in seconds

`normalized_graded_pace`: Adjusted pace for the incline/decline.

`intensity_factor`: Ratio of NGP / FTP

`functional_threshold_pace`: Your average pace, "all out" for 1 hour.

## Grade Adjusted Pace

* http://engineering.strava.com/improving-grade-adjusted-pace/
* http://www.runnersworld.com/races/downhill-all-way

> More than a quarter century ago, British researcher Mervyn Davies
> conducted treadmill tests that revealed that each 1 percent of upgrade
> slowed elite runners by about 3.3 percent.

> That’s uphill. Davies also tested downgrades. Not surprisingly, he
> found that descents don’t give back as much as ascents take away. In
> fact, they only speed you up by about 55 percent as much as the
> corresponding upgrades slow you down.

## Installation

```ruby
gem 'stressfactor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stressfactor

## Usage

    $ ./bin/stressfactor analyze PATH_TO_GPX [--units=metric|english]

## Contributing

1. Fork it ( https://github.com/[my-github-username]/stressfactor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
