#!/usr/bin/env python3

import sys
import os
from os import path
import boto3
import json

def delete_in_order():
	if len(sys.argv) == 1:
		sys.exit(0)
	if len(sys.argv) >= 2:
		group_name = sys.argv[1]
	skip = True if len(sys.argv) == 3  else False

	client = boto3.client('iam')
	try:
		# Will throw an exception here if group doesn't exist
		response = client.get_group(
		    GroupName=group_name
		)

		response = client.list_attached_group_policies(
		    GroupName=group_name,
		)
		attached_policies = response['AttachedPolicies']
		for attached_policy in attached_policies:
			response = client.detach_group_policy(
				GroupName=group_name,
    			PolicyArn=attached_policy['PolicyArn']
			)

		if not skip:
			response = client.delete_group(
	 		   GroupName=group_name
			)

		settings = {"error": 0}
		print(json.dumps(settings))
		sys.exit(0)
		
	except Exception as e:
		error = "{0}".format(e)
		settings = {"error_text": error, "error": 1}
		print(json.dumps(settings))
		sys.exit(0)

if __name__ == "__main__":
	delete_in_order()
