# Fuber

The Fuber application helps automate the process of booking a cab.
Users of the application can book a cab and end it, the cab is found depending on the distance.
hipster only cabs are also present.

This needs [Ruby to be installed](https://www.ruby-lang.org/en/documentation/installation/), followed by some libraries. The steps are listed below.

## Setup

First, install [Ruby](https://www.ruby-lang.org/en/documentation/installation/). Then run the following commands under the `fuber` dir.
This installs the dependencies and runs the test suite to make sure everything is fine.

```
fuber $ ruby -v # confirm Ruby present
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-darwin17]
fuber $ bundle && rspec
Successfully installed bundler-1.16.1
Parsing documentation for bundler-1.16.1
Done installing documentation for bundler after 2 seconds
1 gem installed
Finished in 0.02475 seconds (files took 0.10997 seconds to load)
48 examples, 0 failures


```

## Usage

You can run the application from `fuber` by doing
```
fuber $ rackup
```
This will run the server and the client can then send curl/postman requests
