# Riot Parents

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
    this.mixin('parents')
    this.handleInput = function(e){
      this[e.target.name] = e.target.value
    }
  </script>
</mylogin>

```

