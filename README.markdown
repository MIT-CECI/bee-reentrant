BEE Lab Experiment Review
===

Simple graph from a the given data. A copy of this README can be found at: https://gist.github.com/a98aec327e307ad6f79f

Development
===

Dependencies
---

* jQuery 1.7.2
* Underscore 1.3.1
* Highstock 1.1.5

Javascript Data
---

We need to have a `window.sampleData` matrix, like this (http://pastie.org/3775348):

```javascript

  window.sampleData = [
          [1,  'time-stamp', 21.618, 24.818],
          [2,  'time-stamp', 21.619, 24.818],
          [3,  'time-stamp', 21.623, 24.816],
          [4,  'time-stamp', 21.625, 24.811],
          [5,  'time-stamp', 21.631, 24.8],
          [6,  'time-stamp', 21.633, 24.792],
          [7,  'time-stamp', 21.637, 24.784],
          [8,  'time-stamp', 21.642, 24.771],
          [9,  'time-stamp', 21.646, 24.762],
          [10, 'time-stamp', 21.655, 24.737],
          [11, 'time-stamp', 21.662, 24.723],
          [12, 'time-stamp', 21.664, 24.711],
          [13, 'time-stamp', 21.67, 24.697],
          [14, 'time-stamp', 21.676, 24.683],
          [15, 'time-stamp', 21.677, 24.665]
  ];
```

The first position of the array is the record number. The second one the timestamp on UTC time.

---

The HTML checkboxes that we're going to use need the following attributes:

  `value` is the **index of the sampleData array** for that series

  `name` is the name of the series

A possible markup is shown below:

```html
<form action="">
  <input type="checkbox" class="series-box" id="avg-temp" checked="checked" value="1" name="Test Chamber Avg Temp"/>
  <label for="avg-temp">Test Chamber Avg Temp</label>

  <input type="checkbox" class="series-box" id="air-temp" checked="checked" value="2" name="External Air Temp" />
  <label for="air-temp">External Air Temp</label>
</form>
```

Eager Loading
---

The graph will only load the **checked checkboxes** at first. Then, it will draw the needed ones when the user requests them. This way, we can have more data but still have an initial loadtime that makes sense.

Graph Container
---

The graph container must have an id of "container"

```html
<div id="container">Please wait while we load it. This may take a while.</div>
```