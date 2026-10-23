#!/bin/sh
# Copyright 2026 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -eu

case "${LOAD_GENERATOR_ENABLED:-false}" in
    false)
        echo "Load generation is disabled. Set LOAD_GENERATOR_ENABLED=true to enable it."
        exit 0
        ;;
    true)
        ;;
    *)
        echo "LOAD_GENERATOR_ENABLED must be true or false." >&2
        exit 1
        ;;
esac

if [ -z "${FRONTEND_ADDR:-}" ]; then
    echo "FRONTEND_ADDR must be set to the frontend host:port when load generation is enabled." >&2
    exit 1
fi

loadgen_dir=$(CDPATH= cd "$(dirname "$0")" && pwd)

exec locust \
    --locustfile "$loadgen_dir/locustfile.py" \
    --host="http://${FRONTEND_ADDR}" \
    --headless \
    -u "${USERS:-10}" \
    -r "${RATE:-1}" \
    "$@"
