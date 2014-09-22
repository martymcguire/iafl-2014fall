# MICA Interactive Arts FabLab Fall 2014

This is the source repository for the course website at:

http://marty-mcguire.com/iafl-2014fall/

It is built using the [Ruhoh](http://ruhoh.com/) static site generator, tested on version 2.6.

# License

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/80x15.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">MICA Interactive Arts FabLab Fall 2014</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://marty-mcguire.com/iafl-2014fall/" property="cc:attributionName" rel="cc:attributionURL">Marty McGuire</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.<br />Based on Sam Sheffield's work at <a xmlns:dct="http://purl.org/dc/terms/" href="http://samsheffield.com/os3dff13/" rel="dct:source">http://samsheffield.com/os3dff13/</a>.

# Development

You will need:

* git
* ruby (v 1.9.3 or later) with bundler gem (tested w/ 1.3.5)

Grab the code and prerequisites

* Clone the repo
* `bundle install`

When developing pages, start a local server at `localhost:9292`:

	$ bundle exec ruhoh server

When ready to deploy:

	$ bundle exec ruhoh compile

This puts the generated site content in the `compiled/` directory ready to
copy to your hosting destination.
