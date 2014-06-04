# tankgl

> A webgl game.

### Getting started

`npm install tankgl`

### Testing

watches for file changes and reruns tests and build each time
```bash
  $ grunt watch
```

runs spec tests
```bash
  $ grunt test
```

produces coverage report (needs explicit piping)
```bash
  $ grunt cov
```

###Building
To build simply:
```bash
  $ grunt build
```

###Linting
To lint simply:
```bash
  $ grunt lint
```

###Robert's current workflow
Run the following in two seperate terminals
```bash
  $ grunt watch
```
```bash
  $ npm run start_and_watch
```

###Project Structure
assets/ - Anything that needs to be precompiled, or is vendor.

public/ - Anything that is game asset goes here

src/ - our node.js server side code.

test/ - our "testing-suite"

views/ - our front-end views that get compiled into html

