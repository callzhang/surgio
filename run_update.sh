#!/bin/bash

set -e
set -o pipefail

export SURGIO_NETWORK_TIMEOUT=10000
export SURGIO_NETWORK_RETRY=3
npx surgio generate
npx surgio upload
vercel --prod