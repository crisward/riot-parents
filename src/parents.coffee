module.exports = 
 
  parents:(count)->
    p = @parent
    while count > 0
      if p.parent then p = p.parent else break
      count--
    return p