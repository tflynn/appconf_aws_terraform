
import os
from os import path
import configparser
import json

aws_creds_file = path.expanduser('~/.aws/credentials')
aws_config_file = path.expanduser('~/.aws/config')

aws_profile = 'default'

creds = configparser.ConfigParser()
creds.read(aws_creds_file)
creds_defaults = creds[aws_profile]

config = configparser.ConfigParser()
config.read(aws_config_file)
config_defaults = config[aws_profile]



settings = {'aws_access_key_id': creds_defaults['aws_access_key_id'],
	   'aws_secret_access_key': creds_defaults['aws_secret_access_key'],
	   'region': config_defaults['region']
	  }

print(json.dumps(settings))

