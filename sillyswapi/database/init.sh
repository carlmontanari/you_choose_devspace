#!/bin/bash

psql -U postgres -d starwars -a -f /sillyswapi/scripts/db/seed.sql
