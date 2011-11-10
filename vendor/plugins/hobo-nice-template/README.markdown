Hobo Nice Template
==================

This plugin adds a new template called "nice" to Hobo 1.3 (http://www.hobocentral.net). It is based on the default "clean" template.

[Screenshots available here](https://github.com/suyccom/hobo-nice-template/wiki)


Requirements
------------

* Rails 3.0.9
* Hobo 1.3.0.RC2
* Git


How to use
----------

Install it like this:

    rails plugin install git://github.com/suyccom/hobo-nice-template.git


Go to your application.dryml or front_site.dryml and change the template like this:

    <set-theme name="nice"/>

Then restart your application :)


How to update
-------------

The init hook of the plugin checks for the existence of the files in taglibs and public, and it it doesn't find anything, it copies them. So to update you just have to update the repo and then remove the old files.

Reinstall:

    rails plugin install --force git://github.com/suyccom/hobo-nice-template.git
    
Remove the old files:

    rm app/views/taglibs/themes/nice -Rf
    rm public/hobothemes/nice -Rf
    
And restart the application :)



Copyright (c) 2011 Ignacio Huerta (http://www.unoycero.com), released under the MIT license
