require './bind-polyfill.js'
window.riot = require 'riot'
parents = require '../lib/parents.js'
simulant = require 'simulant'
require './sampletags.tag'

riot.mixin(parents)

describe "subtag",->

  describe "working",->
    beforeEach ->
      @clickspy = sinon.spy()
      @domnode = document.createElement('sample')
      @node = document.body.appendChild(@domnode)
      @tag = riot.mount('sample',{clicked:@clickspy})
  
    afterEach ->
      @domnode = ''
      @tag[0].unmount()
        

    it "should exist",->
      expect(document.querySelectorAll('sample').length).to.equal(1)
      
    it "should run spy from first level button",->
      expect(@clickspy.callCount).to.equal(0)
      simulant.fire(document.querySelector('.button1'),'click')
      expect(@clickspy.callCount).to.equal(1)
      
    it "should run spy from second level button",->
      expect(@clickspy.callCount).to.equal(0)
      simulant.fire(document.querySelector('.parbutton2'),'click')
      simulant.fire(document.querySelector('.parsbutton2'),'click')
      expect(@clickspy.callCount).to.equal(2)

    it "should run spy from third level button",->
      expect(@clickspy.callCount).to.equal(0)
      simulant.fire(document.querySelector('.parbutton3'),'click')
      simulant.fire(document.querySelector('.parsbutton3'),'click')
      expect(@clickspy.callCount).to.equal(2)

    it "should run spy from forth level button",->
      expect(@clickspy.callCount).to.equal(0)
      simulant.fire(document.querySelector('.parbutton4'),'click')
      simulant.fire(document.querySelector('.parsbutton4'),'click')
      expect(@clickspy.callCount).to.equal(2)
    
    it "should run spy from fifth level button",->
      expect(@clickspy.callCount).to.equal(0)
      simulant.fire(document.querySelector('.parbutton5'),'click')
      simulant.fire(document.querySelector('.parsbutton5'),'click')
      expect(@clickspy.callCount).to.equal(2)
      
    it "should run spy from fifth level button",->
      expect(@clickspy.callCount).to.equal(0)
      simulant.fire(document.querySelector('.parbutton6'),'click')
      simulant.fire(document.querySelector('.parsbutton6'),'click')
      expect(@clickspy.callCount).to.equal(2)  
      
    it "should run spy from fifth level button",->
      expect(@clickspy.callCount).to.equal(0)
      simulant.fire(document.querySelector('.parbutton7'),'click')
      simulant.fire(document.querySelector('.parsbutton7'),'click')
      expect(@clickspy.callCount).to.equal(2)
       
  describe "breaking",->

    beforeEach ->
      @clickspy = sinon.spy()
      @domnode = document.createElement('sample2')
      @node = document.body.appendChild(@domnode)
      @tag = riot.mount('sample2',{clicked:@clickspy})
      

    afterEach ->
      @domnode = ''
      @tag[0].unmount()
    
    it "should run spy from nearest existing element if parents don't exist",->
      expect(@clickspy.callCount).to.equal(0)
      simulant.fire(document.querySelector('.parsbutton9'),'click')
      expect(@clickspy.callCount).to.equal(1) 
      
    
      
      