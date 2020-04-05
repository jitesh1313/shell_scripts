#!/bin/bash
Recipient=”admin@example.com”
Subject=”Greeting”
Message=”Welcome to our git”
`mail -s $Subject $Recipient <<< $Message`
