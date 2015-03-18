# DateSpan

More concise representations of date spans

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'date_span', git: 'git://github.com/jutonz/date_span.git''
```

And then execute:

    $ bundle

## Usage
`DateSpan.pluralize(2010, 2011)`  ==> `"2010-1"`  
`DateSpan.pluralize(2009, 2013)`  ==> `"2009-13"`  
  
`DateSpan.singularize('1984-92')` ==> `[1984, 1992]` 



