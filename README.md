# angular-readable-milliseconds

AngularJS filter for converting a number of milliseconds to a human-readable time.
Best used for short amounts of time (< 60 mins) that require more accuracy.

## Usage

Include angular-readable-time.js in your application.

```html
<script src="angular-readable-time.js"></script>
```

Add the `readableTime` module to your application's dependencies.

```js
angular.module('myApp', ['readableTime']);
```

Use the filter by passing it a number of milliseconds.

```html
<p>{{ 1000 | readableTime }}</p>
<p>{{ 119000 | readableTime }}</p>
```

The above example will look something like this:

> 1.0s
>
> 1m 59s

## TO DO

* Implement hours, weeks, months, and years
* Offer options for display preferences (i.e. verbose: 1 minute 54 seconds)

## License

Released under the terms of MIT License:

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
