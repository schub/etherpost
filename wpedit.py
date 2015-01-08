#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Call me with
# WP_XMLRPC, WP_USERNAME, WP_PASSWORD, WP_POST_ID, WP_POST_TITLE, WP_CONTENT, WP_BLOG_ID, TMP_FILE


import sys
import xmlrpclib


# Load API and Content

WP_XMLRPC = sys.argv[1]			# API-URL

TMP_FILE = sys.argv[8]			# temp. content file

with open (TMP_FILE, "r") as contents:
	WP_POST_CONTENT=contents.read()


# Assemble post: title + content

WP_POST = {
	'title': 	sys.argv[5],	# WP_POST_TITLE 
	'description': 	WP_POST_CONTENT	# TMP_FILE
}


# Edit post via wordpress' XML-RPC-API

xmlrpclib.ServerProxy(WP_XMLRPC).metaWeblog.editPost(
	sys.argv[4],			# WP_POST_ID 
	sys.argv[2],	 		# WP_USERNAME
	sys.argv[3], 			# WP_PASSWORD
	WP_POST, 			# WP_POST
	False				# STATUS (to be checked)
)
