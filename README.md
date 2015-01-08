# etherpost.sh

Fetches an etherpad and writes it to an existing to wordpress post using the XML-RPC-API. 

So we can have multiple users editing an wordpress-post simultaniously and update it periodically.

## featuring

* UNIX shell
* curl
* python and it's xmlrpclib

## General

This is about to *edit* a post, not to *create* one. Create a posting and set its categories & tags in adavance and grab the post id. 

Currently, the title is defined in etherpost.sh and the script needs to be restarted in order to change it.

## Get started

Change variables in etherpost.sh to your needs:
* XML-RPC-API-URL
* username / password
* post id
* post title
* etherpad URL
* interval (default=60s)
* blog id (only relevant for wpmu installations)

Run etherpost.sh, preferable in a screen.

## What can be done 

Version for cronjob: Remove the while loop and the sleep-command in order to add script as a cronjob. 
Please commit a solution for logging when doing so :)

Parametrization of pyhton call: Currently while calling the python script the arguments need to be in correct order. One could add support for key/value-parameters, like --username=foo .

Or get rid of shell or python part: Cause my phyton skills are more limited than my shell skills, the python script handles the API-call but nothing else.

## About and license

etherpost.sh was created to enable a multiuser-live-blogging-mode for netzpolitik.org' coverage on the NSA investigation committee ("NSA-Untersuchungssausschuss") of the german parliament whose protocols will only be published with a huge delay -- if they will be published at all.

It is tinkered by wetterfrosch <wetter_ätt_netzpolitik_dott_org>, many thanks to Jan Sipke showing how to use python's xmlrpclib for interacting with wordpress:
	http://jansipke.nl/using-python-to-add-new-posts-in-wordpress/

etherpost.sh is licensed under WTFPL:

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004
 
 Copyright (C) 2004 Sam Hocevar
  14 rue de Plaisance, 75014 Paris, France
 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.
 
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 
  0. You just DO WHAT THE FUCK YOU WANT TO.

