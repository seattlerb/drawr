drawr
    by Aaron Patterson
    http://seattlerb.org/

== DESCRIPTION:
  
This is a ruby wrapper around Plotr with a similar API to Gruff.  You can
create graphs with a similar interface to Gruff, but offload the rendering
to the browser!

== FEATURES/PROBLEMS:
  
* Needs more tests!

== SYNOPSIS:

An example in rails.  Your controller:

  class GraphController < ApplicationController
    def index
      @drawr = Drawr::Pie.new
      @drawr.title = "Twan"
      @drawr.data("One", [1])
      @drawr.data('Two', [2])
      @drawr.data('Three', [2])
      @drawr.data('Four', [10])
      @drawr.data('Five', [6])
    end
  end

Your view:

  <html>
    <head>
      <%= javascript_include_tag 'prototype' %>
      <%= javascript_include_tag 'excanvas' %>
      <%= javascript_include_tag 'Plotr' %>
    </head>
    <body>
      <%= @drawr %>
    </body>
  </html>

== REQUIREMENTS:

* Plotr[http://www.solutoire.com/plotr]

== INSTALL:

* sudo gem install drawr
* require drawr in your environment.rb

== LICENSE:

(The MIT License)

Copyright (c) 2007 Aaron Patterson

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
