sample
  button.button1(onclick="{opts.clicked}") Click Me 1
  myyielder
    button.parbutton2(onclick="{parent.opts.clicked}") Click Me 2
    button.parsbutton2(onclick="{parents(0).opts.clicked}") Click Me 2
    myyielder
      button.parbutton3(onclick="{parent.parent.opts.clicked}") Click Me 3
      button.parsbutton3(onclick="{parents(1).opts.clicked}") Click Me 3
      myyielder
        button.parbutton4(onclick="{parent.parent.parent.opts.clicked}") Click Me 4
        button.parsbutton4(onclick="{parents(2).opts.clicked}") Click Me 4
        myyielder
          button.parbutton5(onclick="{parent.parent.parent.parent.opts.clicked}") Click Me 5
          button.parsbutton5(onclick="{parents(3).opts.clicked}") Click Me 5
          myyielder
            button.parbutton6(onclick="{parent.parent.parent.parent.parent.opts.clicked}") Click Me 6
            button.parsbutton6(onclick="{parents(4).opts.clicked}") Click Me 6
            myyielder
              button.parbutton7(onclick="{parent.parent.parent.parent.parent.parent.opts.clicked}") Click Me 7
              button.parsbutton7(onclick="{parents(5).opts.clicked}") Click Me 7
              myyielder
                button.parbutton8(onclick="{parent.parent.parent.parent.parent.parent.parent.opts.clicked}") Click Me 8
                button.parsbutton8(onclick="{parents(6).opts.clicked}") Click Me 8

myyielder
  <yield />
  
  
sample2
  myyielder
    button.parsbutton9(onclick="{parents(500).opts.clicked}") Click Me 9