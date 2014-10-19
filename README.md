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

## Installation

```ruby
gem 'stressfactor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stressfactor

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/stressfactor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
