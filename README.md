# Devskiller programming task sample - Ruby with rake

## Introduction

With [Devskiller.com](https://devskiller.com) you can assess candidates' programming skills during your recruitment process. Programming tasks are the best way to test candidates programming skills. The candidate is asked to modify source code of an existing project.

During the test, the candidate is allowed to edit the source code of the project with our browser-based code editor and can build the project inside the browser at any time. Candidate can also download the project code and edit it locally with the favorite IDE.

Check out how the test looks from [candidate's perspective](https://help.devskiller.com/candidate-documentation/how-the-devskiller-test-looks-like-from-the-candidate-perspective).

This repo contains an example project for Ruby with rake, below you can find a detailed guide for creating your own programming project. 

**Please make sure to read our [Getting started with programming projects](https://docs.devskiller.com/programming_tasks/index.html) guides first**

## Technical details for Ruby with rake support

Any **Ruby with rake** project might be used as a programming task. We use [CI::Reporter](https://github.com/ci-reporter/ci_reporter) for running unit tests, so any test framework supported by CI::Reporter (Cucumber, Minitest, RSpec, Spinach or Test::Unit) might be used for unit tests. Our sample project uses Minitest framework.

Your project will be executed with following commands:

```sh
bundle install
bundle exec rake ci
```

To make it working you will have to define a `ci` task in your `Rakefile`, that will setup `CI::Reporter` for chosen test framework. 
Here is an example for the Minitest framework:

```ruby
require 'ci/reporter/rake/minitest'

task :ci => ['ci:setup:minitest', 'test']
```

Of course, it is also required to add a dependency to `CI:Reporter` at Gemfile:
```ruby
gem 'ci_reporter_minitest'
```

See sample project files for a full working example.

**When you will be creating a ZIP package with project contents, please skip `./tmp` and `./.bundle` folders.**

## Automatic assessment

It is possible to automatically assess solution posted by the candidate. Automatic assessment is based on Unit Tests results and Code Quality measurements. 

There are two kinds of unit tests:

1. **Candidate tests** - unit tests that are visible for the candidate during the test. Should be used to do only the basic verification and help the candidate to understand the requirements. Candidate tests WILL NOT be used to calculate the final score.
2. **Verification tests** - unit tests that are hidden from the candidate during the test. Files containing verification tests will be added to the project after the candidate finishes the test and will be executed during verification phase. Verification tests result will be used to calculate the final score.

After candidate finishes the test, our platform builds the project posted by the candidate and executes verification tests and static code analysis.

## Devskiller project descriptor

Programming task can be configured with the Devskiller project descriptor file. Just create a `devskiller.json` file and place it in the root directory of your project. Here is an example project descriptor:

```json
{
    "verification" : {
        "testNamePatterns" : [ "Verification.*" ],
        "pathPatterns" : [ "**test/verify_**" ]
    }
}
```

You can find more details about `devskiller.json` descriptor in our [documentation](https://docs.devskiller.com/programming_tasks/project_descriptor.html).

## Automatic verification with verification tests

To enable automatic verification of candidates' solution, you need to define which tests should be treated as verification tests.

All files classified as verification tests will be removed from a project prepared for the candidate.

To define verification tests, you need to set two configuration properties in `devskiller.json` project descriptor:

- `testNamePatterns` - an array of RegEx patterns which should match all the test names of verification tests. 
Test name contains: `[class_name]`. In our sample project all verification tests are in a class that starts with `Verification` prefix, so the following pattern will be sufficient:

```json
"testNamePatterns" : [ "Verification.*" ]
```

- `pathPatterns` - an array of GLOB patterns which should match all the files containing verification tests. All the files that match defined patterns will be deleted from candidates' projects and will be added to the projects during the verification phase. These files will not be visible for candidate during the test.

```json
"pathPatterns" : [ "**test/verify_**" ]
```

