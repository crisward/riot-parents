# Riot Parents

[![Build Status](https://travis-ci.org/crisward/riot-parents.svg)](https://travis-ci.org/crisward/riot-parents)
[![Coverage Status](https://coveralls.io/repos/github/crisward/riot-parents/badge.svg?branch=master)](https://coveralls.io/github/crisward/riot-parents?branch=master)
[![NPM Downloads](https://img.shields.io/npm/dm/riot-parents.svg)](https://www.npmjs.com/package/riot-parents)
[![NPM Downloads](https://img.shields.io/npm/v/riot-parents.svg)](https://www.npmjs.com/package/riot-parents)

This is a simple [Riot.js](http://riotjs.com/) mixin which helps with the issue of 

```javascript
this.parent.parent.someproperty
```
and replaces it with
```javascript
this.parents(2).someproperty
```
|with parents | with parent
|-----        |-------
|this.parents(0)   | this.parent
|this.parents(1)   | this.parent.parent
|this.parents(2)   | this.parent.parent.parent
|this.parents(3)   | this.parent.parent.parent.parent

I realise that accessing deep ancestors like this makes your components perhaps more
coupled that they should be. But sometimes it's nice to be able to drop elements into
`yielding` components and still be able to easily communitcate with them.

I've developed this as a mixin to test out this idea before proposing
as a possible solution to this issue in riot.

See https://github.com/riot/riot/issues/1415 for the discussion

## Installing

```
npm install riot-parents
```

## Usage

To add it to all tags
```javascript
var parents = require('riot-parents')
riot.mixin(parents)
```
To add it to specific tags, load it the same way, but assign it a name

```javascript
var parents = require('riot-parents')
riot.mixin("parents",parents)
```

Then you can use it within specific tags to access parent tags.
eg.

```html
<mylogin>
  <modal>
    <loginform>
      <formrow label="Username">
        <input oninput="{parents(2).handleInput}" name="username" type="text" />
      </div>
      <formrow label="Password">
        <label>Password</label>
        <input oninput="{parents(2).handleInput}" name="password" type="password" />
     </formrow>
    </loginform>
  </modal>
  
  <script>
    this.mixin('parents') // <-- don't need this if you've installed it globally
    this.handleInput = function(e){
      this[e.target.name] = e.target.value
    }
  </script>
</mylogin>

```



## License

(The MIT License)

Copyright (c) 2015 Cris Ward

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
