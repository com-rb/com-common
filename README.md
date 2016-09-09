# ::Com, ::Com::Common

Common parts of well decoupled [Ruby](https://www.ruby-lang.org/) libraries.

## Overview

This library(gem) contains common classes and modules for other [com-rb
libraries and toolsets](https://github.com/com-rb). It defines
[`::Com`](lib/com.rb) and [`::Com::Common`](lib/com/common.rb)
namespaces, error modules and classes which are commonly used
or from which concrete exceptions should be inherited or which should be
mixed to concrete exceptions' classes.

## Dependencies

### Runtime

* [MRI Ruby](https://www.ruby-lang.org/) version 2.3.1 or higher

### Development

* [Bundler](http://bundler.io/) version 1.12.5 or higher
* Other dependencies will be installed automatically by running
  [`bundle install`](http://bundler.io/v1.11/bundle_install.html) from
  library's root directory.

## Installation

### Production

You can install this library manually with

```
gem install com-common
```

with resolving all of their dependencies manually.

The preffered way to install it is to rely on [Bundler](http://bundler.io/) in
your application.

Assuming that, add follow to your `Gemfile`.

```ruby
gem "com-common", ">= 0.2.1"
```

And then execute from the directory with `Gemfile` (likely it should be your
application's root directory):

```bash
$ bundle
```

### Adding this library(gem) as a runtime dependency to other libraries(gems)

This is the most common use case of that library.
Likely you already know how to do that, but for clarity sake here is some tips and links.

Add follow line to your library's [`gemspec`](http://guides.rubygems.org/specification-reference/) file:

```ruby
spec.add_runtime_dependency 'com-common', '>= 0.2.1'
```

See also [official documentation on rubygems about adding runtime dependencies](http://guides.rubygems.org/specification-reference/#add_runtime_dependency).

### Development

While developming new library which depends on changes to [`com-common`](https://github.com/com-rb/com-common)
you likely want to test you changes to [`com-common`](https://github.com/com-rb/com-common)
with your own library.

To do this add runtime dependency in your library's [`gemspec`](http://guides.rubygems.org/specification-reference/)
file like described in [previous section](#adding-this-librarygem-as-a-runtime-dependency-to-other-librariesgems).

Then add gem definition for [`com-common`](https://github.com/com-rb/com-common)
to your library's [`Gemfile`](http://bundler.io/gemfile.html) with
[`:path`](http://bundler.io/gemfile.html) parameter which points to root directory
of your local copy of [`com-common`](https://github.com/com-rb/com-common).

If we assume that you have follow directory structure of git repositories:

```
~
|- projects
   |- com-common
   |- your-library
```

Then you have to add to your `Gemfile` something like follows:

```ruby
gem "com-common",
  path: "../com-common"

```

After all run [`bundle install`](http://bundler.io/v1.12/man/bundle-install.1.html)
to let your changes to make affect.

## Usage

### Library's interactive prompt

To experiment with that code, run [`bin/console`](bin/console) for an interactive prompt from project's root directory.

## Documentation

### Exceptions modules and classes hierarchy

For better understanding of exceptions in [Ruby](https://www.ruby-lang.org/) see official documentation for
[`::Exception` class](http://ruby-doc.org/core-2.3.1/Exception.html).

This library provides following modules and classes for exceptions.
Most of modules are intended for tagging exceptions raised
from [com-rb libraries](https://github.com/com-rb).

* [`::Com::StandartError`](#comstandarderror)
  * [`::Com::Common::StandardError`](#comcommonstandarderror)
* [`::Com::Error`](#comerror)
  * [`::Com::Common::Error`](#comcommonerror)
  * [`::Com::AbstractMethodError`](#comabstractmethoderror)

#### `::Com::StandardError`

The module [`::Com::StandardError`](lib/com/standard_error.rb) supposed to
be mixed into all exceptions of [`::StandardError`](http://ruby-doc.org/core-2.3.1/StandardError.html) type.
In most situation those errors should not be catched. They signals about incorrect
usages of interfaces, about code written in incorrect way, unoverrided methods
provided by "abstract" classes or modules, etc.

In most cases you can suppose that errors which include this module would be
catched on compilation if [Ruby](https://www.ruby-lang.org/)
would be [statically typed language](https://en.wikipedia.org/wiki/Type_system#Static_type_checking).

#### `::Com::Common::StandardError`

The module [`::Com::Common::StandardError`](lib/com/common/standard_error.rb)
supposed to be mixed into all exceptions of [`::StandardError`](http://ruby-doc.org/core-2.3.1/StandardError.html)
type from [`::Com::Common`](lib/com/common.rb) namespace.

#### `::Com::Error`

The module [`::Com::Error`](lib/com/error.rb) supposed to be mixed into
all exceptions of [`::RuntimeError`](http://ruby-doc.org/core-2.3.1/RuntimeError.html) type.
In most situations those error should be catched and/or logged. Usually they
signals about incorrect way of execution which is based on data received
during runtime, unexpected data, catched and reraised exceptions from used
libraries, etc.

#### `::Com::Common::Error`

The module [`::Com::Common::Error`](lib/com/common/error.rb) supposed to
be mixed into all exceptions of [::RuntimeError](http://ruby-doc.org/core-2.3.1/RuntimeError.html)
type from [`::Com::Common`](lib/com/common.rb) namespace.

#### `::Com::AbstractMethodError`

The class [`::Com::AbstractMethodError`](lib/com/abstract_method_error.rb)
represents errors related to "abstract" methods.

*__Note:__ Despite [Ruby](https://www.ruby-lang.org/) does not have conception
of [abstract methods](https://en.wikipedia.org/wiki/Method_%28computer_programming%29#Abstract_methods)
usually developers do want to force [concrete classes](https://en.wikipedia.org/wiki/Class_%28computer_programming%29#Abstract_and_Concrete)
to provide implementation for the method called from the base class.
In that case called method with assumed obligatory implementation in
[concrete classes](https://en.wikipedia.org/wiki/Class_%28computer_programming%29#Abstract_and_Concrete)
can be desided as [abstract method](https://en.wikipedia.org/wiki/Method_%28computer_programming%29#Abstract_methods).*

For usage examples, see an example for
[`::Com::AbstractMethodError.method_not_overridden_error` method](lib/com/abstract_method_error.rb#L20).

*__Note:__ sometimes
[`NotImplementedError`](http://ruby-doc.org/core-2.3.1/NotImplementedError.html)
__incorrectly__ used to
communicate the need for "abstract" method implementation.*

## Development

After checking out the repo, run [`bin/setup`](bin/setup) to install dependencies.
Then, run [`bin/console`](bin/console) for an interactive prompt that will allow
you to experiment.
Run [`bundle exec com-common`](http://bundler.io/v1.11/bundle_exec.html) to
use the code located in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run
[`bundle exec rake install`](https://github.com/bundler/bundler/blob/master/lib/bundler/gem_helper.rb#L43).
To release a new version, update the version number in
[`lib/com/common/version.rb`](lib/com/common/version.rb),
and then run
[`bundle exec rake release`](https://github.com/bundler/bundler/blob/master/lib/bundler/gem_helper.rb#L53)
to create a git tag for the version,
[push git commits and tags](https://git-scm.com/docs/git-push).

## Testing

There are different ways to run tests. You can use the one which you used to.

```bash
$ rake # uses default rake task which is spec
```

or

```bash
$ rspec
```

or

```bash
$ rake spec
```

or

```bash
$ rspec spec/
```

## Contributing

1. Clone it: `git clone git@github.com:com-rb/com-common.git`
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Ensure all [tests pass successfully](#testing)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
