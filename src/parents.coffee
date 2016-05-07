module.exports = 
 
  parents:(count)->
    p = @parent
    for i in [0...count]
      if p.parent then p = p.parent else break
    return p